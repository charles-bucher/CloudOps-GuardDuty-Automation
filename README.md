# CloudOps GuardDuty Automation

![AWS](https://img.shields.io/badge/AWS-GuardDuty-orange?style=for-the-badge) ![Terraform](https://img.shields.io/badge/Terraform-1.5-blue?style=for-the-badge)

---

## 🚀 Overview
Automates **AWS GuardDuty deployment** using **Terraform**, creating a fully operational security monitoring setup in AWS.

### Highlights:
- GuardDuty fully enabled across your AWS account(s)  
- Automated security findings notifications  
- Repeatable, auditable Infrastructure-as-Code deployment  

This repo is **portfolio-ready**, showing end-to-end CloudOps and security automation skills.  

---

## ✨ Features
- **Infrastructure as Code** – Terraform automates the entire setup  
- **Security Monitoring** – GuardDuty ready to detect threats  
- **Extensible** – Easily add SNS notifications, Lambda integrations, or custom monitoring rules  
- **Safe & Repeatable** – Deployable across multiple AWS accounts  
- **Visual Documentation** – Screenshots and GIFs included for workflow demonstration  

---

## ⚙️ Getting Started

### Prerequisites
- AWS account with GuardDuty permissions  
- [Terraform](https://www.terraform.io/) installed  
- Git CLI  

### Setup
```bash
# Clone the repository
git clone https://github.com/charles-bucher/cloudOps-guardDuty-automation.git
cd cloudOps-guardDuty-automation

# Initialize Terraform
terraform init

# Preview the plan
terraform plan

# Apply the infrastructure
terraform apply
⚠️ Always review the Terraform plan before applying in production accounts.

🎬 Visual Walkthrough
Step	Screenshot / GIF
1️⃣ GitHub Push	
2️⃣ Terraform Plan	
3️⃣ Terraform Plan Confirmation	
4️⃣ Terraform Apply (GIF)	
5️⃣ GuardDuty Dashboard (GIF)	

GIFs show real-time progress of Terraform apply and GuardDuty enabling, adding a “wow factor” for recruiters.

🗂 Repository Structure
bash
Copy code
cloudOps-guardDuty-automation/
├─ .github/workflows/terraform-apply.yml  # GitHub Action for Terraform apply
├─ main.tf                                # Terraform main config
├─ variables.tf                           # Terraform variables
├─ outputs.tf                             # Terraform outputs
├─ README.md
└─ screenshots/guardduty_screenshots/     # Screenshots + GIFs for portfolio
🤝 Contributing
Open issues or submit pull requests for:

Automation improvements

Additional monitoring integrations

Enhanced visual documentation

📄 License
MIT License

💡 Pro Tips for Maximum Impact:

Keep GIFs <5MB for fast GitHub rendering

Add badges for AWS, Terraform version, or CI/CD status

Use this README as a template for all CloudOps projects—instant portfolio showcase

yaml
Copy code

---