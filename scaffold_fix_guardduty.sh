#!/bin/bash
echo "🛠 Charles’s scaffold fix for guardduty-threat-simulation-response starting..."

BASE_DIR="$PWD"

folders=(
    "ansible"
    "docs/screenshots"
    "modules"
    "scripts"
    "terraform"
    "terraform/modules"
    "terraform/environments"
    "terraform/modules/ec2"
    "terraform/modules/cloudwatch"
    "terraform/modules/guardduty"
)

for folder in "${folders[@]}"; do
    if [ ! -d "$BASE_DIR/$folder" ]; then
        mkdir -p "$BASE_DIR/$folder"
        echo "✅ Created folder: $folder"
    else
        echo "ℹ️ Folder already exists: $folder"
    fi
done

files=(
    "README.md"
    "LICENSE"
    "CODE_OF_CONDUCT.md"
    "CONTRIBUTING.md"
    "scripts/deploy.sh"
    "terraform/main.tf"
    "terraform/variables.tf"
    "terraform/outputs.tf"
)

for file in "${files[@]}"; do
    if [ ! -f "$BASE_DIR/$file" ]; then
        touch "$BASE_DIR/$file"
        echo "📄 Created file: $file"
    else
        echo "ℹ️ File already exists: $file"
    fi
done

cat > "$BASE_DIR/README.md" <<EOL
# GuardDuty Threat Simulation Response 🔒

Charles’s project to automate threat simulation response using AWS GuardDuty, Terraform, and Ansible.

## Overview
Automates threat detection & response with AWS GuardDuty using Terraform and Ansible.

## Screenshots
Placeholder screenshots:
- docs/screenshots/architecture.png
- docs/screenshots/simulation_result.png
- docs/screenshots/terraform_output.png

## Structure
ansible/
docs/screenshots/
modules/
scripts/
terraform/

## Tech Stack
- Terraform
- Ansible
- AWS GuardDuty
- Bash

## Author
Charles Bucher  
🔗 https://github.com/Tommy813-lab
EOL

touch docs/screenshots/architecture.png
touch docs/screenshots/simulation_result.png
touch docs/screenshots/terraform_output.png

echo "📄 Updated README.md and created screenshot placeholders."
echo "🚀 Charles’s scaffold fix complete."

