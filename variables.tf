# ==============================================
# Input Variables for GuardDuty Automation
# ==============================================

variable "aws_region" {
  description = "AWS region for GuardDuty deployment"
  type        = string
  default     = "us-east-1"
}

variable "name" {
  description = "Base name for all GuardDuty resources"
  type        = string
  default     = "guardduty-automation"

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.name))
    error_message = "Name must contain only lowercase letters, numbers, and hyphens"
  }
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod"
  }
}

variable "alert_email" {
  description = "Email address for high/critical severity GuardDuty alerts"
  type        = string
  default     = "your-email@example.com"

  validation {
    condition     = can(regex("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", var.alert_email))
    error_message = "Must be a valid email address"
  }
}

variable "alert_phone" {
  description = "Phone number for SMS alerts (format: +1234567890)"
  type        = string
  default     = ""

  validation {
    condition     = var.alert_phone == "" || can(regex("^\\+[1-9]\\d{1,14}$", var.alert_phone))
    error_message = "Phone number must be in E.164 format (e.g., +12025551234) or empty string"
  }
}

variable "enable_lambda_response" {
  description = "Enable Lambda function for automated incident response"
  type        = bool
  default     = false
}

variable "alert_on_medium_severity" {
  description = "Log medium severity findings to CloudWatch (4.0-6.9 severity)"
  type        = bool
  default     = true
}

variable "log_retention_days" {
  description = "Number of days to retain CloudWatch logs"
  type        = number
  default     = 30

  validation {
    condition     = contains([1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653], var.log_retention_days)
    error_message = "Log retention must be a valid CloudWatch retention period"
  }
}

variable "enable_s3_protection" {
  description = "Enable GuardDuty S3 protection"
  type        = bool
  default     = true
}

variable "enable_kubernetes_protection" {
  description = "Enable GuardDuty Kubernetes protection (only if using EKS)"
  type        = bool
  default     = false
}

variable "enable_malware_protection" {
  description = "Enable GuardDuty malware protection (EC2 EBS volume scanning)"
  type        = bool
  default     = false
}

variable "finding_publishing_frequency" {
  description = "How often to publish findings (FIFTEEN_MINUTES, ONE_HOUR, SIX_HOURS)"
  type        = string
  default     = "FIFTEEN_MINUTES"

  validation {
    condition     = contains(["FIFTEEN_MINUTES", "ONE_HOUR", "SIX_HOURS"], var.finding_publishing_frequency)
    error_message = "Must be FIFTEEN_MINUTES, ONE_HOUR, or SIX_HOURS"
  }
}

variable "tags" {
  description = "Additional tags to apply to all resources"
  type        = map(string)
  default     = {}
}
