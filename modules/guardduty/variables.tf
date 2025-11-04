variable "enable" {
  description = "Enable GuardDuty detector"
  type        = bool
  default     = true
}

variable "finding_frequency" {
  description = "Frequency of notifications about updated findings (FIFTEEN_MINUTES, ONE_HOUR, SIX_HOURS)"
  type        = string
  default     = "FIFTEEN_MINUTES"
}

variable "enable_s3_protection" {
  description = "Enable S3 protection in GuardDuty"
  type        = bool
  default     = true
}

variable "enable_kubernetes_protection" {
  description = "Enable Kubernetes protection (only if using EKS)"
  type        = bool
  default     = false
}

variable "enable_malware_protection" {
  description = "Enable malware protection for EC2 instances"
  type        = bool
  default     = false # Can be expensive
}

variable "s3_bucket_arn" {
  description = "ARN of S3 bucket for GuardDuty findings"
  type        = string
}

variable "kms_key_arn" {
  description = "ARN of KMS key for encrypting GuardDuty findings (optional)"
  type        = string
  default     = null
}

variable "s3_bucket_policy" {
  description = "Dependency on S3 bucket policy"
  type        = any
  default     = null
}

variable "tags" {
  description = "Tags to apply to GuardDuty detector"
  type        = map(string)
  default     = {}
}
variable "name" {
  description = "Base name for GuardDuty resources"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "alert_email" {
  description = "Email address for GuardDuty alerts"
  type        = string
  default     = ""
}

variable "alert_phone" {
  description = "Phone number for SMS alerts"
  type        = string
  default     = ""
}

variable "enable_lambda_response" {
  description = "Enable Lambda for automated response"
  type        = bool
  default     = false
}

