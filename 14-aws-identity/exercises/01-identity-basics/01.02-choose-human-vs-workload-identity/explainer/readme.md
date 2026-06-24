# Explainer: Choose Human vs Workload Identity

Human access and workload access should be modeled differently.

Humans need authentication, MFA, group membership, approval, and audit.

Workloads need machine identity, short-lived credentials, least privilege, and automatic rotation.

Good defaults:

```text
human engineer -> IAM Identity Center permission set
AWS workload -> IAM role
external CI/CD -> OIDC federated role
application customer -> Cognito or external customer IdP
```

Avoid giving people or workloads broad static access keys.
