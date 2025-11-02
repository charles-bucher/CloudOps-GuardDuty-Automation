 cloudOps-guardDuty-automation
AWS GuardDuty Automation for Real-World Support Scenarios
🚧 What This Repo Represents
This isn’t a demo — it’s a reproducible support lab built from scratch. I simulated a real-world customer scenario: enabling GuardDuty across multiple accounts, automating findings export, and validating infrastructure with Terraform. Every phase is documented with screenshots, commentary, and honest troubleshooting.
✅ Built from late-night labs
🧠 Designed for support empathy and reproducibility
📸 Screenshot-driven proof of every step


🧭 Scenario Overview
A customer needs GuardDuty enabled across their AWS Organization, with findings exported to a centralized S3 bucket. They want automation, cost awareness, and Terraform validation. This repo walks through the full lifecycle:
|  |  |  | 
|  | 01_init |  | 
|  | 02_deploy |  | 
|  | 03_terraform |  | 



📂 Folder Breakdown with Screenshots
00_clone — Clone and Setup
Cloning the repo and prepping the environment.
Cloning the Repo

01_init — Management Account Setup
- Enables GuardDuty in the management account
- Invites member accounts
- IAM permissions and troubleshooting
Terraform Installed

02_deploy — Member Account Automation
- Accepts GuardDuty invitations
- Enables GuardDuty in each member account
- Configures findings export to S3
Terraform Resources Created
GuardDuty Running
Deployment Complete

03_terraform — Infrastructure Validation
- Terraform plan and apply
- Bucket policy validation
- GuardDuty detector confirmation
Terraform Plan Output

🧠 What I Practice in This Lab
- Reproducing customer scenarios from scratch
- Documenting root cause analysis and IAM troubleshooting
- Building alerting and remediation workflows
- Explaining AWS services in plain language
- Prioritizing cost awareness and support empathy
- Honest assessment of what I know vs. what I’m learning

💬 About Me
I’m Charles Bucher — a self-taught cloud engineer and full-time delivery driver, building a tech career from scratch. I learn by simulating real support scenarios and documenting every step. My goal: land a cloud support or DevOps role and show my kids what grit looks like.
- GitHub: charles-bucher
- LinkedIn: Charles Bucher
- Email: Quietopscb@gmail.com


