# ==============================================
# GuardDuty Module Outputs
# ==============================================

output "detector_id" {
  description = "ID of the GuardDuty detector"
  value       = aws_guardduty_detector.main.id
}

output "detector_arn" {
  description = "ARN of the GuardDuty detector"
  value       = aws_guardduty_detector.main.arn
}

output "sns_topic_arn" {
  description = "ARN of the SNS topic for GuardDuty alerts"
  value       = aws_sns_topic.guardduty_alerts.arn
}

output "sns_topic_name" {
  description = "Name of the SNS topic"
  value       = aws_sns_topic.guardduty_alerts.name
}

output "eventbridge_rule_arn" {
  description = "ARN of the EventBridge rule for high severity findings"
  value       = aws_cloudwatch_event_rule.guardduty_high_severity.arn
}

output "eventbridge_rule_name" {
  description = "Name of the EventBridge rule"
  value       = aws_cloudwatch_event_rule.guardduty_high_severity.name
}

output "email_subscription_arn" {
  description = "ARN of email SNS subscription (if configured)"
  value       = var.alert_email != "" ? aws_sns_topic_subscription.guardduty_email[0].arn : null
}

output "sms_subscription_arn" {
  description = "ARN of SMS SNS subscription (if configured)"
  value       = var.alert_phone != "" ? aws_sns_topic_subscription.guardduty_sms[0].arn : null
}

# output "publishing_destination_arn" {
#   description = "ARN of S3 publishing destination"
#   value       = aws_guardduty_publishing_destination.s3.destination_arn
# }
