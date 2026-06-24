# Lesson 14: AWS Identity Types and Access Control

## Goal

Understand the main AWS identity types and practice reading IAM-style policies without needing a real AWS account.

This lesson teaches:

- IAM users, groups, roles, and policies
- IAM Identity Center for workforce access
- STS temporary credentials and role assumption
- Service roles and workload identities
- Resource-based policies
- AWS Organizations, Service Control Policies, and centralized root access options
- Amazon Cognito for application end-user identity
- How identity policy, trust policy, resource policy, SCP, and explicit deny interact

## Why AWS Identity Matters

Most AWS security incidents are not caused by a missing firewall rule. They are often caused by credentials that are too powerful, too long-lived, exposed in logs or Git, or attached to the wrong identity.

AWS identity design answers:

- Who is trying to act?
- What credentials are they using?
- Which policy allows or denies the action?
- Which account and resource are affected?
- Is the credential short-lived?
- Can the access be audited and revoked?

## AWS Identity Types

| Type | Used For | Credential Shape | Notes |
| --- | --- | --- | --- |
| IAM user | Legacy or exceptional human/service access | Long-lived access key or console password | Avoid for routine workforce access when Identity Center is available |
| IAM group | Permission grouping for IAM users | No credentials | Groups cannot be used as principals in resource policies |
| IAM role | Temporary access for humans, services, or workloads | STS temporary credentials | Preferred for workloads and cross-account access |
| IAM policy | Permission document | JSON | Can be identity-based, resource-based, permissions boundary, SCP, or session policy |
| IAM Identity Center user/group | Workforce identity | Federated SSO session | Recommended for human access across accounts |
| AWS service principal | AWS service acting as a principal | Service-assumed role | Example: `ec2.amazonaws.com`, `lambda.amazonaws.com` |
| Federated identity | External IdP user or workload | SAML/OIDC or web identity token exchanged with STS | Used for enterprise SSO, EKS IRSA, GitHub Actions OIDC |
| Cognito user | Application end user | App user token | For customer-facing or app-facing identity, not AWS operator access |
| AWS account root user | Account owner identity | Root credentials or centralized privileged root action | Lock down; do not use for daily work |

## Access Evaluation Mental Model

AWS access is roughly evaluated like this:

```text
explicit deny anywhere -> denied
otherwise, needs an allow from the relevant policy set
SCPs and permission boundaries limit maximum permission
trust policy controls who can assume a role
identity/resource policies control what actions are allowed
```

For a role assumption, split the question:

1. Can the caller call `sts:AssumeRole` on the role?
2. Does the role trust policy trust that caller?
3. Once assumed, what can the role do?

## Human Access: Identity Center vs IAM Users

For people, prefer IAM Identity Center when possible.

Identity Center gives:

- Centralized workforce access
- SSO into multiple AWS accounts
- Permission sets instead of one-off IAM users
- Easier joiner/mover/leaver workflows

IAM users still exist, but long-lived access keys should be exceptional, tightly scoped, rotated, and monitored.

## Workload Access: Prefer Roles

For workloads, prefer roles and temporary credentials.

Examples:

- EC2 instance profile
- ECS task role
- Lambda execution role
- EKS service account with OIDC federation
- GitHub Actions OIDC role into AWS
- Cross-account role for automation

Avoid baking access keys into images, `.env` files, Kubernetes Secrets, or CI logs.

## Files in This Lesson

```text
policies/
  identity-policies/
    s3-read-only.json
    deny-dangerous-iam-actions.json
  trust-policies/
    ec2-service-role-trust.json
    github-actions-oidc-trust.json
    cross-account-audit-trust.json
  resource-policies/
    s3-bucket-read-for-role.json
  scp/
    deny-leaving-organization.json
scripts/
  validate-json.sh
  explain-policy.sh
  simulate-access.sh
```

## Run the Local Checks

Validate JSON:

```bash
cd hands-on-practice/14-aws-identity
./scripts/validate-json.sh
```

Explain a policy:

```bash
./scripts/explain-policy.sh policies/identity-policies/s3-read-only.json
```

Run the simple learning simulator:

```bash
./scripts/simulate-access.sh s3:GetObject
./scripts/simulate-access.sh s3:DeleteObject
./scripts/simulate-access.sh iam:CreateUser
```

This simulator is intentionally tiny. It is not a replacement for AWS IAM Access Analyzer or the AWS policy simulator. It exists so you can practice the policy evaluation shape offline.

## Example Decisions

Use these as defaults:

```text
Human engineer access          -> IAM Identity Center permission set
EC2 app access to S3           -> IAM role attached as instance profile
Lambda access to DynamoDB      -> Lambda execution role
GitHub Actions deploy to AWS   -> OIDC federated role, no stored AWS keys
Customer login for SaaS app    -> Amazon Cognito or external IdP
Multi-account guardrail        -> AWS Organizations SCP
Emergency account ownership    -> Root user, locked down with MFA, or centralized root access in AWS Organizations
```

## Production Notes

For production:

- Enable MFA for human access.
- Lock down the root user; for AWS Organizations member accounts, evaluate centralized root access and removal of long-lived root credentials.
- Prefer SSO and federation over IAM users.
- Prefer roles and temporary credentials over static access keys.
- Use least privilege and review unused permissions.
- Use SCPs as guardrails, not as the only security layer.
- Monitor CloudTrail for sensitive actions.
- Avoid wildcard actions and resources unless justified.
- Use permission boundaries for delegated IAM administration.
- Use Access Analyzer and policy validation tools before rollout.

## Exercises

Use the exercise track after reading the policy examples:

```text
exercises/README.md
```

The exercises cover identity classification, human vs workload access, identity policies, trust policies, STS, Identity Center, SCPs, and Cognito.

## References

- AWS IAM identities: https://docs.aws.amazon.com/IAM/latest/UserGuide/id.html
- IAM roles: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html
- IAM policies and permissions: https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html
- IAM policy evaluation logic: https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html
- IAM Identity Center: https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html
- AWS account root user: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-user.html
- Centralized root access for member accounts: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-enable-root-access.html
- AWS STS AssumeRole: https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html
- AWS Organizations SCPs: https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps.html
- Amazon Cognito: https://docs.aws.amazon.com/cognito/latest/developerguide/what-is-amazon-cognito.html
