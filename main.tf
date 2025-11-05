# ==============================================
# AWS GuardDuty Automation with Terraform
# Author: Charles Bucher
# Purpose: Automated threat detection and alerting
# ==============================================

terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# ==============================================
# Data Sources
# ==============================================

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

# ==============================================
# S3 Bucket for GuardDuty Findings
# ==============================================

module "secure_bucket" {
  source = "./modules/s3_secure"
  name   = "${var.name}-findings-${data.aws_caller_identity.current.account_id}"
}

# S3 Bucket Policy - Allow GuardDuty to Write Findings
resource "aws_s3_bucket_policy" "guardduty_findings" {
  bucket = module.secure_bucket.bucket_id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowGuardDutyToUseGetBucketLocation"
        Effect = "Allow"
        Principal = {
          Service = "guardduty.amazonaws.com"
        }
        Action   = "s3:GetBucketLocation"
        Resource = module.secure_bucket.bucket_arn
      },
      {
        Sid    = "AllowGuardDutyToPutFindings"
        Effect = "Allow"
        Principal = {
          Service = "guardduty.amazonaws.com"
        }
        Action   = "s3:PutObject"
        Resource = "${module.secure_bucket.bucket_arn}/*"
      },
      {
        Sid    = "DenyUnencryptedUploads"
        Effect = "Deny"
        Principal = {
          Service = "guardduty.amazonaws.com"
        }
        Action   = "s3:PutObject"
        Resource = "${module.secure_bucket.bucket_arn}/*"
        Condition = {
          StringNotEquals = {
            "s3:x-amz-server-side-encryption" = "AES256"
          }
        }
      }
    ]
  })

  depends_on = [module.secure_bucket]
}

# ==============================================
# GuardDuty Detector with Full Configuration
# ==============================================

module "guardduty" {
  source = "./modules/guardduty"

  name                         = var.name
  environment                  = var.environment
  s3_bucket_arn                = module.secure_bucket.bucket_arn
  kms_key_arn                  = null # Using default S3 encryption
  s3_bucket_policy             = aws_s3_bucket_policy.guardduty_findings
  alert_email                  = var.alert_email
  alert_phone                  = var.alert_phone
  enable_lambda_response       = var.enable_lambda_response
  enable_s3_protection         = true
  enable_kubernetes_protection = false # Set to true if using EKS
  enable_malware_protection    = false # Can be expensive - enable in production

  tags = {
    Name        = "${var.name}-guardduty"
    Environment = var.environment
    Project     = "GuardDuty-Automation"
    ManagedBy   = "Terraform"
    CostCenter  = "Security"
  }

  depends_on = [aws_s3_bucket_policy.guardduty_findings]
}

# ==============================================
# CloudWatch Log Group for GuardDuty Events
# ==============================================

resource "aws_cloudwatch_log_group" "guardduty_events" {
  name              = "/aws/guardduty/${var.name}"
  retention_in_days = var.log_retention_days

  tags = {
    Name        = "${var.name}-guardduty-logs"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# ==============================================
# CloudWatch Logs Resource Policy
# ==============================================

resource "aws_cloudwatch_log_resource_policy" "guardduty_events" {
  policy_name = "${var.name}-guardduty-events-policy"

  policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "events.amazonaws.com"
        }
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "${aws_cloudwatch_log_group.guardduty_events.arn}:*"
      }
    ]
  })
}

# ==============================================
# EventBridge Rule for Medium Severity (Optional)
# ==============================================

resource "aws_cloudwatch_event_rule" "guardduty_medium_severity" {
  count       = var.alert_on_medium_severity ? 1 : 0
  name        = "${var.name}-medium-severity-findings"
  description = "Capture GuardDuty findings with Medium severity for logging"

  event_pattern = jsonencode({
    source      = ["aws.guardduty"]
    detail-type = ["GuardDuty Finding"]
    detail = {
      severity = [
        { numeric = [">=", 4, "<", 7] } # Medium severity (4.0-6.9)
      ]
    }
  })

  tags = {
    Name        = "${var.name}-medium-severity"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# EventBridge Target - Log Medium Severity to CloudWatch
resource "aws_cloudwatch_event_target" "guardduty_logs" {
  count     = var.alert_on_medium_severity ? 1 : 0
  rule      = aws_cloudwatch_event_rule.guardduty_medium_severity[0].name
  target_id = "SendToCloudWatchLogs"
  arn       = aws_cloudwatch_log_group.guardduty_events.arn
  role_arn  = aws_iam_role.eventbridge_logs[0].arn
}

# ==============================================
# IAM Role for CloudWatch Events to Write Logs
# ==============================================

resource "aws_iam_role" "eventbridge_logs" {
  count = var.alert_on_medium_severity ? 1 : 0
  name  = "${var.name}-eventbridge-logs-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "events.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name        = "${var.name}-eventbridge-logs-role"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_iam_role_policy" "eventbridge_logs" {
  count = var.alert_on_medium_severity ? 1 : 0
  name  = "${var.name}-eventbridge-logs-policy"
  role  = aws_iam_role.eventbridge_logs[0].id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "${aws_cloudwatch_log_group.guardduty_events.arn}:*"
      }
    ]
  })
}
