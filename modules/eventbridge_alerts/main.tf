# EventBridge Rule - Capture GuardDuty findings
resource "aws_cloudwatch_event_rule" "guardduty_findings" {
  name        = "${var.name_prefix}-guardduty-findings"
  description = "Capture all GuardDuty findings"

  event_pattern = jsonencode({
    source      = ["aws.guardduty"]
    detail-type = ["GuardDuty Finding"]
    detail = {
      severity = var.severity_filter
    }
  })

  tags = var.tags
}

# EventBridge Target - Send to SNS
resource "aws_cloudwatch_event_target" "sns" {
  rule      = aws_cloudwatch_event_rule.guardduty_findings.name
  target_id = "SendToSNS"
  arn       = var.sns_topic_arn

  input_transformer {
    input_paths = {
      severity    = "$.detail.severity"
      type        = "$.detail.type"
      title       = "$.detail.title"
      description = "$.detail.description"
      resource    = "$.detail.resource.resourceType"
      account     = "$.detail.accountId"
      region      = "$.detail.region"
      time        = "$.detail.updatedAt"
    }

    input_template = <<EOF
"🚨 GuardDuty Alert - Severity: <severity>"
"━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
"Finding Type: <type>"
"Title: <title>"
"Description: <description>"
""
"Resource: <resource>"
"Account: <account>"
"Region: <region>"
"Time: <time>"
"━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
"Take action in GuardDuty console"
EOF
  }
}
