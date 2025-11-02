variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "sns_topic_arn" {
  description = "ARN of SNS topic to send alerts to"
  type        = string
}

variable "severity_filter" {
  description = "Minimum severity level to alert on (array of numbers: 0-8.9)"
  type        = list(number)
  default     = [4, 4.0, 4.1, 4.2, 4.3, 4.4, 4.5, 4.6, 4.7, 4.8, 4.9, 5, 5.0, 5.1, 5.2, 5.3, 5.4, 5.5, 5.6, 5.7, 5.8, 5.9, 6, 6.0, 6.1, 6.2, 6.3, 6.4, 6.5, 6.6, 6.7, 6.8, 6.9, 7, 7.0, 7.1, 7.2, 7.3, 7.4, 7.5, 7.6, 7.7, 7.8, 7.9, 8, 8.0, 8.1, 8.2, 8.3, 8.4, 8.5, 8.6, 8.7, 8.8, 8.9] # Medium and above
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
