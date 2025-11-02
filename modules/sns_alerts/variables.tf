variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "alert_email" {
  description = "Email address for GuardDuty alerts (requires manual confirmation)"
  type        = string
  default     = ""
}

variable "alert_phone" {
  description = "Phone number for SMS alerts (format: +1234567890)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
