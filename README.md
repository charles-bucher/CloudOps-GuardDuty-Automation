# 🛡️ cloudOps-guardDuty-automation

Terraform module for AWS GuardDuty automation.  
Built for reproducibility, modular scaling, and real-world support visibility.

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


---

## 📸 Screenshots

<p align="center">
  <img src="screenshots/clone_repo.png" alt="Clone Repo" width="450"/>
  <img src="screenshots/terraform_installed.png" alt="Terraform Installed" width="450"/>
  <img src="screenshots/guardduty_running.png" alt="GuardDuty Running" width="450"/>
  <img src="screenshots/tf_plan.png" alt="Terraform Plan Screenshot" width="450"/>
  <img src="screenshots/pushed_screenshot.png" alt="GuardDuty Deployment Screenshot" width="450"/>
</p>

---

## ⚙️ Setup

```bash
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"

✅ Improvements here:  
1. Added the two new screenshots (`tf_plan.png` and `pushed_screenshot.png`) to the gallery.  
2. Cleaned spacing and headers for readability.  
3. Used `<p align="center">` for a neat, centered gallery.  
4. Minor markdown polish so it looks professional on GitHub.  

If you want, I can write the **exact push commands** so you can commit and push this polished README in one go. Do you want me to do that?
