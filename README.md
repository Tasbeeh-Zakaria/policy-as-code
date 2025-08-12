# Policy-as-Code Across Kubernetes, Azure and AWS

Demonstrating cross-cloud policy enforcement with Kubernetes (OPA Gatekeeper), Azure Policy and AWS Service Control Policies—automated and secure by design. This lab shows how to **write, apply, and validate security/compliance policies** in multi-cloud and container environments, integrating automation, CI/CD and real-time policy monitoring.

---

## Table of Contents
- [Overview](#overview)
- [Real-World Risk](#real-world-risk)
- [What I Built](#what-i-built)
- [Diagram](#diagram)
- [Objectives](#objectives)
- [Steps Performed](#steps-performed)
  - [1. Kubernetes + OPA Gatekeeper Setup]
  - [2. Azure Policy with Bicep]  
  - [3. AWS Service-Control-Policies] 
  - [4. Bonus Automation & Alerts]
- [Screenshots](#screenshots)
- [Lessons Learned](#lessons-learned)
- [Notes and Limitations](#notes-and-limitations)
- [References](#references)
- [Contact](#contact)

---

## Overview

This lab implements **Policy-as-Code** across Kubernetes, Azure and AWS.  
The goal: enforce security and compliance rules automatically, prevent misconfigurations before deployment, and demonstrate a recruiter-ready multi-cloud security skill set.

**Core Technologies:**
- **Kubernetes** with [OPA Gatekeeper](https://open-policy-agent.github.io/gatekeeper/) for admission control.
- **Azure Policy** using [Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- **AWS Service Control Policies** (SCP) via the AWS CLI.
- **GitHub Actions** CI/CD for policy testing.
- **Grafana + Loki** for real-time policy violation dashboards.
- **Slack integration** for policy alerts.
- **Self-healing scripts** for auto-remediation.

---

## Real-World Risk

Without automated guardrails, cloud and container environments can drift from security baselines.  
Misconfigured Kubernetes deployments, untagged Azure resources or AWS accounts without MFA can lead to **compliance failures, security breaches, and costly incidents**.  
This lab demonstrates how to **shift left**—preventing violations before they reach production.

---

## What I Built

- **Kubernetes** policy to enforce required labels on deployments using OPA Gatekeeper.  
- **Azure Policy** (Bicep) to deny resource creation without environment tags.  
- **AWS SCP** to block all actions unless MFA is enabled.  
- **Automation** with CI/CD, Slack alerts and self-healing for missing tags or insecure settings.  
- **Unified dashboard** to view violations across platforms.

---

## Diagram

![Policy Architecture](diagram.png)

---

## Objectives

- Enforce consistent security policies across Kubernetes, Azure and AWS.
- Demonstrate **preventive** rather than reactive security.
- Showcase automation with CI/CD pipelines.
- Provide portfolio-ready evidence of multi-cloud expertise.

---

## Steps Performed

### 1. Kubernetes + OPA Gatekeeper Setup
   - Created a local Kubernetes cluster with Kind (*Screenshot:* `cluster_created.png`)*
   - Installed OPA Gatekeeper for policy enforcement (*Screenshot:* `gatekeeper_ready.png`)*
   - Applied the ConstraintTemplate to define required labels (*Screenshot:* `constraint-templates-crds.png`)*
   - Described the constraint template parameters for required labels (*Screenshot:* `describe-constraints-requiredlabels.png`)*
   - Applied the constraint to require the `app` label on workloads (*Screenshot:* `get-constraints-requiredlabels.png`)*
   - Verified constraint operation by simulating a violation (*Screenshot:* `gatekeeper-labels-policy-deny.png`)*
   - Listed and verified all constraints in the environment (*Screenshot:* `all-constraints-violations.png`)*
   - Validated constraint enforcement with describe & verification commands (*Screenshot:* `constraints-verification-and-describe.png`)*

---

### 2. Azure Policy with Bicep
   - Authored and deployed the Azure Policy to require an `environment` tag (*Screenshot:* `azure_policy_created.png`)*
   - Verified the policy definition in the Azure portal (*Screenshot:* `azure_policy_assigned.png`)*
   - Checked policy effect for compliance (allow scenario) (*Screenshot:* `azure_policy_allow.png`)*
   - Tested the policy with a non-compliant resource (deny scenario) (*Screenshot:* `azure_policy_deny.png`)*
   - Applied Azure Policy templates to enforce compliance at scale (*Screenshot:* `templates_applied.png`)*
   - Verified policy violations for missing latest tags (*Screenshot:* `violation-no-latest-tags.png`)*
   - Verified policy violations for missing resource limits (*Screenshot:* `violation-require-limits.png`)*

---

### 3. AWS Service Control Policies (SCP)
   - Logged in to AWS using SSO for ephemeral credentials (*Screenshot:* `aws_sso_login.png`)*
   - Created the SCP JSON to require MFA for all actions (*Screenshot:* `AWS-PolicyCreated-MFA.png`)*
   - Attached the SCP to the target Organizational Unit (*Screenshot:* `OU-Policy-Attach.png`)*
   - Viewed SCP details in AWS CLI output (*Screenshot:* `scp_details.png`)*
   - Verified SCP enforcement with a successful deny-without-MFA test (*Screenshot:* `scp-denywithoutmfa-success.png`)*

---

### 4. Bonus Automation, Alerts & Self-Healing
   - Configured GitHub Actions CI to run `conftest` for policy testing (*Screenshot: `github_actions_policy_pass.png`)*
   - Logged into Grafana for real-time policy dashboard access (*Screenshot:* `grafana_login.png`)*
   - Displayed live dashboard example of multi-cloud policy violations (*Screenshot:* `dashboard-example.png`)*
   - Tested Slack alert integration for policy violations (*Screenshot:* `slack_alert_simulation.png`)*
   - Demonstrated self-healing script to auto-tag missing resources (*Screenshot:* `self_heal_tags.png`)*
  
---

## Screenshots

*All screenshots are included in the `screenshots/` folder.*

| Step  | Filename                                  | Description                                      |
|-------|-------------------------------------------|--------------------------------------------------|
| 1.1   | cluster_created.png                       | Kubernetes cluster created with Kind             |
| 1.2   | gatekeeper_ready.png                      | OPA Gatekeeper pods running                      |
| 1.3   | constraint-templates-crds.png             | ConstraintTemplate for required labels           |
| 1.4   | describe-constraints-requiredlabels.png   | Describing the required labels template          |
| 1.5   | get-constraints-requiredlabels.png        | Constraints applied and listed                   |
| 1.6   | gatekeeper-labels-policy-deny.png         | Denied workload missing `app` label              |
| 1.7   | all-constraints-violations.png            | Overview of constraint violations                |
| 1.8   | constraints-verification-and-describe.png | Constraint verification output                   |
| 2.1   | azure_policy_created.png                  | Azure Policy created via Bicep                   |
| 2.2   | azure_policy_assigned.png                 | Azure Policy assigned at subscription scope      |
| 2.3   | azure_policy_allow.png                    | Azure Policy allow scenario                      |
| 2.4   | azure_policy_deny.png                     | Azure Policy deny scenario                       |
| 2.5   | templates_applied.png                     | Templates applied to enforce policy              |
| 2.6   | violation-no-latest-tags.png              | Violation: missing latest tag                    |
| 2.7   | violation-require-limits.png              | Violation: missing resource limits               |
| 3.1   | aws_sso_login.png                         | AWS CLI SSO login                                |
| 3.2   | AWS-PolicyCreated-MFA.png                 | SCP JSON for MFA enforcement                     |
| 3.3   | OU-Policy-Attach.png                      | SCP attached to OU                               |
| 3.4   | scp_details.png                           | SCP details in CLI output                        |
| 3.5   | scp-denywithoutmfa-success.png            | SCP deny-without-MFA test success                |
| 4.1   | github_actions_policy_pass.png            | GitHub Actions policy test passing               |
| 4.2   | grafana_login.png                         | Grafana login for dashboard access               |
| 4.3   | dashboard-example.png                     | Multi-cloud policy violation dashboard           |
| 4.4   | slack_alert_simulation.png                | Slack alert for policy violation                 |
| 4.5   | self_heal_tags.png                        | Auto-remediation tagging script                  |

---

## Lessons Learned

- **OPA Gatekeeper** provides strong admission control for Kubernetes but requires careful template definition.
- Azure Policy integrates naturally with IaC via Bicep for consistent enforcement.
- AWS SCPs impact entire accounts—scope policies carefully to avoid disruptions.
- Unified dashboards and alerts make violations visible across platforms.
- Self-healing scripts can resolve issues without manual intervention.

---

## Notes and Limitations

- Kubernetes simulated locally with Kind; no managed service was used.
- Azure and AWS work done in non-production accounts.
- Integrations (Grafana, Slack) were set up for demo purposes only.

---

## References

- [OPA Gatekeeper Documentation](https://open-policy-agent.github.io/gatekeeper/)
- [Azure Policy Documentation](https://learn.microsoft.com/en-us/azure/governance/policy/overview)
- [AWS SCP Documentation](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html)
- [Conftest](https://www.conftest.dev/)

---

## Contact

Sebastian Silva C. – August, 2025 – Berlin, Germany  
- [LinkedIn](https://www.linkedin.com/in/sebastiansilc/)  
- [GitHub](https://github.com/SebaSilC)  
- [sebastian@playbookvisualarts.com](mailto:sebastian@playbookvisualarts.com)
