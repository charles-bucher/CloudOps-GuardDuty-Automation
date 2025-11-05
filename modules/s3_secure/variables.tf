# ==============================================
# S3 Secure Bucket Module Variables
# ==============================================

variable "name" {
  description = "Base name for the S3 bucket"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the S3 bucket"
  type        = map(string)
  default     = {}
}