# GuardDuty Automation Architecture

This repo implements a modular security pipeline using:

- AWS GuardDuty for threat detection
- EventBridge for routing findings
- SNS for alert delivery
- Terraform for infrastructure automation

## Workflow Overview

1. GuardDuty detects suspicious activity
2. EventBridge triggers on findings
3. SNS sends alerts to email
4. Terraform provisions and manages all resources

More diagrams and module breakdowns coming soon.