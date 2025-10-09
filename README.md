# GuardDuty Threat Simulation & Response

Automated AWS GuardDuty Threat Simulation & Response — Terraform-based lab that deploys GuardDuty, simulates security findings, and triggers automated incident response workflows. Includes scripts, screenshots, and cleanup automation for cloud security practice and demonstrations.

---

## Project Walkthrough

### 1. Clone Repository
![Clone Repository](screenshots/00_clone/clone_Repo.png)

### 2. Initialization
![Terraform Installed](screenshots/01_init/terraform_installed.png)
![Initialization Screenshot](screenshots/01_init/Screenshot%202025-10-09%20111039.png)

### 3. Deployment
![Deployed](screenshots/02_deploy/deployed.png)
![GuardDuty Instance Running](screenshots/02_deploy/guardduty-instance-running.png)
![GuardDuty Running](screenshots/02_deploy/guardduty-running.png)
![Terraform Made](screenshots/02_deploy/terraform_made.png)

### 4. Terraform Configuration
![Terraform Plan](screenshots/03_terraform/terraform-plan.png)

### 5. Cleanup & Destroy
![Destroy Resources](screenshots/04_Destroy/destroy.png)

---

## Technologies Used
- AWS GuardDuty
- Terraform
- AWS CLI
- Python/Bash scripting

## Setup Instructions
1. Clone this repository
2. Configure AWS credentials
3. Run `terraform init`
4. Run `terraform apply`
5. Execute threat simulation scripts
6. Review GuardDuty findings
7. Run `terraform destroy` for cleanup
