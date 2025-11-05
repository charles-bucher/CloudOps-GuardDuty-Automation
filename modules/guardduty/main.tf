# GuardDuty Detector
resource "aws_guardduty_detector" "main" {
  enable                       = true
  finding_publishing_frequency = "FIFTEEN_MINUTES"

  datasources {
    s3_logs {
      enable = true
    }
    kubernetes {
      audit_logs {
        enable = false
      }
    }
    malware_protection {
      scan_ec2_instance_with_findings {
        ebs_volumes {
          enable = true
        }
      }
    }
  }

  tags = {
    Name        = "${var.name}-detector"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Export findings to S3
resource "aws_guardduty_publishing_destination" "s3" {
  detector_id      = aws_guardduty_detector.main.id
  destination_arn  = var.s3_bucket_arn
  destination_type = "S3"

  depends_on = [aws_guardduty_detector.main]
}

# SNS Topic for Alerts
resource "aws_sns_topic" "guardduty_alerts" {
  name              = "${var.name}-alerts"
  display_name      = "GuardDuty Security Alerts"
  kms_master_key_id = "alias/aws/sns"

  tags = {
    Name        = "${var.name}-alerts"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# SNS Topic Policy
resource "aws_sns_topic_policy" "guardduty_alerts" {
  arn = aws_sns_topic.guardduty_alerts.arn

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowEventBridgePublish"
        Effect = "Allow"
        Principal = {
          Service = "events.amazonaws.com"
        }
        Action   = "SNS:Publish"
        Resource = aws_sns_topic.guardduty_alerts.arn
      }
    ]
  })
}

# Email Subscription
resource "aws_sns_topic_subscription" "guardduty_email" {
  count     = var.alert_email != "" ? 1 : 0
  topic_arn = aws_sns_topic.guardduty_alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

# SMS Subscription (optional)
resource "aws_sns_topic_subscription" "guardduty_sms" {
  count     = var.alert_phone != "" ? 1 : 0
  topic_arn = aws_sns_topic.guardduty_alerts.arn
  protocol  = "sms"
  endpoint  = var.alert_phone
}

# EventBridge Rule for High/Critical Findings
resource "aws_cloudwatch_event_rule" "guardduty_high_severity" {
  name        = "${var.name}-high-severity-findings"
  description = "Capture GuardDuty findings with High or Critical severity"

  event_pattern = jsonencode({
    source      = ["aws.guardduty"]
    detail-type = ["GuardDuty Finding"]
    detail = {
      severity = [
        { numeric = [">", 7] } # High severity (7.0-8.9) and Critical (9.0+)
      ]
    }
  })

  tags = {
    Name        = "${var.name}-high-severity"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# EventBridge Target - Send to SNS
resource "aws_cloudwatch_event_target" "guardduty_sns" {
  rule      = aws_cloudwatch_event_rule.guardduty_high_severity.name
  target_id = "SendToSNS"
  arn       = aws_sns_topic.guardduty_alerts.arn

  input_transformer {
    input_paths = {
      severity    = "$.detail.severity"
      type        = "$.detail.type"
      region      = "$.detail.region"
      account     = "$.detail.accountId"
      time        = "$.detail.service.eventFirstSeen"
      title       = "$.detail.title"
      description = "$.detail.description"
    }

    input_template = <<EOF
"🚨 GuardDuty Security Alert

Severity: <severity>
Finding Type: <type>
Account: <account>
Region: <region>

Title: <title>
Description: <description>

First Seen: <time>

Check AWS Console for full details."
EOF
  }
}

# IAM Role for Lambda (Optional - for automated response)
resource "aws_iam_role" "guardduty_lambda" {
  count = var.enable_lambda_response ? 1 : 0
  name  = "${var.name}-lambda-response-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name        = "${var.name}-lambda-role"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
