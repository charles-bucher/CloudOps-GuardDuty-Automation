aws_region  = "us-east-1"
name        = "guardduty-sim"
environment = "dev"

# REPLACE THIS WITH YOUR REAL EMAIL!
alert_email = "charles.bucher@youremail.com"

alert_phone = ""
enable_lambda_response       = false
alert_on_medium_severity     = true
enable_s3_protection         = true
enable_kubernetes_protection = false
enable_malware_protection    = false
log_retention_days           = 30
finding_publishing_frequency = "FIFTEEN_MINUTES"
