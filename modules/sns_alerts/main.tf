# SNS Topic for GuardDuty alerts
resource "aws_sns_topic" "guardduty_alerts" {
  name         = "${var.name_prefix}-guardduty-alerts"
  display_name = "GuardDuty Security Alerts"

  tags = var.tags
}

# SNS Topic Policy - Allow EventBridge to publish
resource "aws_sns_topic_policy" "guardduty_alerts" {
  arn = aws_sns_topic.guardduty_alerts.arn

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowEventBridgeToPublish"
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

# Email Subscription (requires manual confirmation)
resource "aws_sns_topic_subscription" "email" {
  count     = var.alert_email != "" ? 1 : 0
  topic_arn = aws_sns_topic.guardduty_alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

# SMS Subscription (no confirmation needed)
resource "aws_sns_topic_subscription" "sms" {
  count     = var.alert_phone != "" ? 1 : 0
  topic_arn = aws_sns_topic.guardduty_alerts.arn
  protocol  = "sms"
  endpoint  = var.alert_phone
}
