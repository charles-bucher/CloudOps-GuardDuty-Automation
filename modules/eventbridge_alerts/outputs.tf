output "rule_id" {
  description = "ID of the EventBridge rule"
  value       = aws_cloudwatch_event_rule.guardduty_findings.id
}

output "rule_arn" {
  description = "ARN of the EventBridge rule"
  value       = aws_cloudwatch_event_rule.guardduty_findings.arn
}
