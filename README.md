# AWS GuardDuty Security Lab - Learning Project

**Status**: Enabled GuardDuty | Generated test findings | Learning automation

---

## What This Actually Is

I'm learning AWS security monitoring by enabling GuardDuty and figuring out how it works. Right now it's mostly me clicking around the console and reading documentation—not automated threat response yet.

---

## What I've Done So Far

### Week 1: Enabled GuardDuty
- Turned on GuardDuty in AWS console
- Watched it analyze CloudTrail, VPC Flow Logs, DNS logs
- Waited for findings (nothing happened because I'm not being attacked)

### Week 2: Generated Test Findings
- Used AWS GuardDuty sample findings feature
- Saw what different threat types look like
- Learned the severity levels (Low, Medium, High)

### Week 3: Set Up SNS Alerts
- Created SNS topic to get notified of findings
- Connected EventBridge rule to GuardDuty
- Got my first alert email (from a test finding)

---

## What I Learned

### GuardDuty Isn't Automatic Response
**What I thought**: It would automatically block threats  
**Reality**: It just DETECTS and ALERTS—you have to respond  
**Why this matters**: Real automation requires Lambda or other tools

### Cost Isn't What I Expected
**What I thought**: Would be expensive  
**Reality**: Affordable for small test environments  
**Based on**: CloudTrail events, VPC flow logs, DNS queries analyzed

### Findings Are Detailed
**What surprised me**: How much context each finding provides  
**Example info**: IP addresses, affected resources, timestamps, severity  
**Useful for**: Understanding what actually happened

---

## Current Challenges

### What I'm Stuck On
- **Automated Response**: Want Lambda to quarantine compromised instances
- **Understanding Severity**: When is "Medium" actually serious?
- **Integration**: Getting findings into CloudWatch dashboards
- **Terraform**: Trying to enable GuardDuty with IaC (learning curve)

### What Doesn't Work Yet
- ❌ No automated remediation
- ❌ No custom threat detection rules
- ❌ Not integrated with other security tools
- ❌ Manual investigation only

---

## Real Security Skills I'm Building

- Understanding AWS security services
- Reading and interpreting security findings
- Event-driven architecture basics (EventBridge)
- Thinking about incident response workflows
- Cost management for security tools

---

## What's Actually in This Repo

```
cloudOps-guardDuty-automation/
├── screenshots/             # GuardDuty console and findings examples
├── sample_findings.json     # Test findings I generated
├── eventbridge_rule.json    # Rule to catch GuardDuty alerts
├── sns_setup_notes.md       # How I configured notifications
└── learning_notes.md        # My security research notes
```

---

## The Plan (Not Done Yet)

### Phase 1: Detection (Current)
- ✅ GuardDuty enabled
- ✅ Alerts working
- ✅ Understanding findings

### Phase 2: Response (Learning)
- ⏳ Lambda function to isolate instances
- ⏳ Security group automation
- ⏳ Automated ticketing

### Phase 3: Analysis (Future)
- ⏳ Log analysis with Athena
- ⏳ Trend analysis
- ⏳ Custom dashboards

---

## Honest Assessment

**What I can do now:**
- Enable GuardDuty in any AWS account
- Set up basic alerting
- Read and understand findings
- Explain what GuardDuty monitors

**What I can't do yet:**
- Build automated incident response
- Write custom detection logic
- Scale this across multiple accounts
- Integrate with SIEM tools

**What I'm actively learning:**
- Lambda for security automation
- AWS security best practices
- How real security teams use GuardDuty

---

## Why This Project Matters

Security monitoring is critical in cloud environments. This project shows I:
- Understand security concepts
- Can set up detection tools
- Am learning automation
- Think about incident response
- Know my current skill limits

---

## Technologies Used

- **AWS GuardDuty**: Threat detection service
- **AWS EventBridge**: Event routing for alerts
- **AWS SNS**: Notification delivery
- **AWS CloudTrail**: Activity logging (GuardDuty data source)
- **VPC Flow Logs**: Network traffic monitoring (GuardDuty data source)
- **Terraform**: Infrastructure as Code (learning to use)

---

## Setup Instructions

**If you want to try this:**

1. Enable GuardDuty in AWS Console
2. Wait 15 minutes for initial analysis
3. Generate sample findings: GuardDuty → Settings → Sample Findings
4. Create SNS topic for notifications
5. Set up EventBridge rule to route findings to SNS
6. Check your email for test alerts

**Warning**: This is a learning exercise. Don't rely on this for real security.

---

## What I'm Learning Next

1. Build Lambda function for automatic instance isolation
2. Practice investigating real-looking findings
3. Add this to Terraform configuration
4. Study for AWS Security Specialty cert
5. Learn how to integrate with other security tools

---

## What This Is NOT

- ❌ Not a complete security solution
- ❌ Not automated incident response (yet)
- ❌ Not production-ready
- ❌ Not enterprise-grade
- ❌ Not a replacement for security best practices

It's a hands-on learning lab where I'm figuring out AWS security one step at a time.

---

## Lessons Learned

- Security monitoring requires both detection AND response
- GuardDuty findings need context to be actionable
- Setting up alerts is easy, automation is hard
- Small test environments are great for learning
- Documentation matters when troubleshooting security issues

---

## About Me

Self-taught, learning AWS security at night. Building practical skills to break into cloud security roles.

**GitHub**: [charles-bucher](https://github.com/charles-bucher)  
**LinkedIn**: [Charles Bucher](https://linkedin.com/in/charles-bucher85813)  
**Email**: Quietopscb@gmail.com

---

## License

MIT License - This is educational code, use at your own risk.
