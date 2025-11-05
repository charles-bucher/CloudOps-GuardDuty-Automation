
🛡️ cloudOps-guardDuty-automation
Terraform module for AWS GuardDuty automation
Built for reproducibility, modular scaling, and real-world support visibility.

📌 Highlights
- 🔐 GuardDuty detector with S3, malware, and optional Kubernetes protection
- 📡 EventBridge filtering by severity
- 📣 SNS alerting via email/SMS
- 📦 Secure S3 bucket with encryption, lifecycle, and versioning
- 🧠 Optional IAM role for Lambda remediation
- 🧱 Modular variables, outputs, and tagging

🧱 Architecture Overview
GuardDuty → EventBridge → SNS → Email/SMS
         ↘︎ S3 Export

Screenshots

![Clone Repo](screenshots/clone_repo.png)
![Terraform Installed](screenshots/terraform_installed.png)
![GuardDuty Running](screenshots/guardduty_running.png)


⚙️ Setup
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"



📘 Variables
|  |  |  | 
| name_prefix | string |  | 
| environment | string |  | 
| alert_email | string |  | 
| alert_phone | string |  | 
| enable_lambda_response | bool |  | 
| tags | map(string) |  | 



📤 Outputs
|  |  | 
| sns_topic_arn |  | 
| sns_topic_name |  | 
| email_subscription_arn |  | 
| sms_subscription_arn |  | 
| bucket_arn |  | 
| eventbridge_rule_arn |  | 



📸 Deployment Screenshots
<details><summary><strong>🔁 Clone & Initialize</strong></summary>
- ✅ Cloned repo locally
- ✅ Verified Terraform installation
- ✅ Initialized working directory
Clone Repo
Terraform Installed
</details>
<details><summary><strong>🚀 Deploy GuardDuty Automation</strong></summary>
- ✅ Terraform plan and apply
- ✅ GuardDuty detector created
- ✅ SNS topic and subscriptions deployed
- ✅ EventBridge rule filtered by severity
Terraform Deployed
GuardDuty Instance Running
GuardDuty Active
</details>
<details><summary><strong>🧹 Destroy Infrastructure</strong></summary>
- ✅ Terraform destroy executed cleanly
- ✅ All resources removed
- ✅ Verified teardown in AWS console
Terraform Destroyed
</details>

🧠 Commentary
“This repo automates GuardDuty detection and alerting with secure, modular Terraform. It’s built for reproducibility, environment-aware deployment, and real-world support scenarios. Every component is tagged, encrypted, and documented — designed to scale across teams and prove technical depth.”

