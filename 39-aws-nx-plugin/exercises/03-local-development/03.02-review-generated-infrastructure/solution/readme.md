# Solution: Review Generated Infrastructure

A CDK team should review `cdk diff` and synthesized CloudFormation. A Terraform team should review generated HCL, provider configuration, backend assumptions, variables, outputs, and `terraform plan`.

Risky details include broad IAM permissions, public API exposure, auth callback URLs, Cognito domains, secrets, and environment-specific names.

Generated outputs should be recorded because operators and downstream projects need stable values such as URLs, identifiers, and resource names.
