# ==============================================
# Output Values for GuardDuty Deployment
# ==============================================

output "guardduty_detector_id" {
  description = "ID of the GuardDuty detector"
  value       = module.guardduty.detector_id
}

output "guardduty_detector_arn" {
  description = "ARN of the GuardDuty detector"
  value       = module.guardduty.detector_arn
}

output "findings_bucket_id" {
  description = "ID of the S3 bucket storing GuardDuty findings"
  value       = module.secure_bucket.bucket_id
}

output "findings_bucket_arn" {
  description = "ARN of the S3 bucket storing GuardDuty findings"
  value       = module.secure_bucket.bucket_arn
}

output "sns_topic_arn" {
  description = "ARN of the SNS topic for high/critical alerts"
  value       = module.guardduty.sns_topic_arn
}

output "sns_topic_name" {
  description = "Name of the SNS topic for alerts"
  value       = module.guardduty.sns_topic_name
}

output "eventbridge_rule_arn" {
  description = "ARN of the EventBridge rule for high severity findings"
  value       = module.guardduty.eventbridge_rule_arn
}

output "cloudwatch_log_group" {
  description = "Name of CloudWatch log group for GuardDuty events"
  value       = aws_cloudwatch_log_group.guardduty_events.name
}

output "aws_region" {
  description = "AWS region where GuardDuty is deployed"
  value       = data.aws_region.current.name
}

output "aws_account_id" {
  description = "AWS account ID"
  value       = data.aws_caller_identity.current.account_id
}

output "deployment_summary" {
  description = "Summary of deployed GuardDuty resources"
  value = {
    detector_id           = module.guardduty.detector_id
    findings_bucket       = module.secure_bucket.bucket_id
    sns_topic             = module.guardduty.sns_topic_name
    alert_email           = var.alert_email
    alert_phone           = var.alert_phone != "" ? "Configured" : "Not configured"
    region                = data.aws_region.current.name
    account               = data.aws_caller_identity.current.account_id
    s3_protection         = var.enable_s3_protection
    kubernetes_protection = var.enable_kubernetes_protection
    malware_protection    = var.enable_malware_protection
  }
}

output "next_steps" {
  description = "Next steps after deployment"
  value       = <<-EOT
  
  ✅ GuardDuty Deployment Complete!
  
  📋 What Was Deployed:
  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  • GuardDuty Detector:     ${module.guardduty.detector_id}
  • Findings S3 Bucket:     ${module.secure_bucket.bucket_id}
  • Alert SNS Topic:        ${module.guardduty.sns_topic_name}
  • CloudWatch Logs:        ${aws_cloudwatch_log_group.guardduty_events.name}
  • AWS Region:             ${data.aws_region.current.name}
  • AWS Account:            ${data.aws_caller_identity.current.account_id}
  
  📧 Alert Configuration:
  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  • Email:                  ${var.alert_email}
  • SMS:                    ${var.alert_phone != "" ? "Enabled" : "Disabled"}
  • High/Critical Alerts:   Enabled (severity ≥ 7.0)
  • Medium Severity Logs:   ${var.alert_on_medium_severity ? "Enabled" : "Disabled"}
  
  🎯 Next Steps:
  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  1. CHECK YOUR EMAIL
     • Confirm SNS subscription (${var.alert_email})
     • Click the confirmation link from AWS
  
  2. VIEW GUARDDUTY CONSOLE
     • https://console.aws.amazon.com/guardduty/home?region=${data.aws_region.current.name}#/findings
  
  3. VIEW FINDINGS IN S3
     • https://s3.console.aws.amazon.com/s3/buckets/${module.secure_bucket.bucket_id}
  
  4. GENERATE TEST FINDINGS (Optional)
     • Use AWS GuardDuty sample findings:
       aws guardduty create-sample-findings \
         --detector-id ${module.guardduty.detector_id} \
         --finding-types Recon:EC2/PortProbeUnprotectedPort
     • Check your email for alerts within 15 minutes
  
  5. VIEW CLOUDWATCH LOGS
     • https://console.aws.amazon.com/cloudwatch/home?region=${data.aws_region.current.name}#logsV2:log-groups/log-group/${replace(aws_cloudwatch_log_group.guardduty_events.name, "/", "$252F")}
  
  💰 Cost Estimate:
  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  • GuardDuty:              ~$4-5/month (light usage)
  • S3 Storage:             ~$0.10/month (findings data)
  • SNS:                    First 1,000 emails FREE
  • CloudWatch Logs:        ~$0.50/month
  • TOTAL:                  ~$5-6/month
  
  ⚠️  NOTE: Malware protection costs extra ($0.30 per scanned GB)
  
  🧹 Cleanup:
  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  To destroy all resources:
    terraform destroy
  
  This will:
    • Disable GuardDuty detector
    • Delete SNS topic and subscriptions
    • Delete S3 bucket (if empty)
    • Remove EventBridge rules
    • Delete CloudWatch log group
  
  EOT
}
