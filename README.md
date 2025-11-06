# 🛡️ cloudOps-guardDuty-automation

Terraform module for AWS GuardDuty automation.  
Built for reproducibility, modular scaling, and real-world support visibility.

[![Terraform](https://img.shields.io/badge/Terraform-1.5.8-blue?logo=terraform&logoColor=white)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)

---

## 📌 Highlights
- 🔐 GuardDuty detector with S3, malware, and optional Kubernetes protection  
- 📡 EventBridge filtering by severity  
- 📣 SNS alerting via email/SMS  
- 📦 Secure S3 bucket with encryption, lifecycle, and versioning  
- 🧠 Optional IAM role for Lambda remediation  
- 🧱 Modular variables, outputs, and tagging  

---

## 🧱 Architecture Overview

GuardDuty → EventBridge → SNS → Email/SMS
↘︎ S3 Export

php-template
Copy code

---

## 📸 Screenshots

<p align="center">
  <img src="screenshots/clone_repo.png" alt="Clone Repo" width="400"/>
  <img src="screenshots/terraform_installed.png" alt="Terraform Installed" width="400"/>
</p>

<p align="center">
  <img src="screenshots/guardduty_running.png" alt="GuardDuty Running" width="400"/>
  <img src="screenshots/tf_plan.png" alt="Terraform Plan Screenshot" width="400"/>
</p>

<p align="center">
  <img src="screenshots/pushed_screenshot.png" alt="GuardDuty Deployment Screenshot" width="400"/>
</p>

---

## ⚙️ Setup

```bash
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
💡 Notes
Designed for modular scaling and easy real-world deployment

All outputs and variables are tagged and documented for easy integration

Optional IAM roles allow customized Lambda remediation

🔗 Links
GitHub Repo

Terraform Docs

Made  by Charles Bucher

markdown
Copy code

