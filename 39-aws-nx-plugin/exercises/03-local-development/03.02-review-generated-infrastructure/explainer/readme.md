# Explainer: Review Generated Infrastructure

Generated infrastructure is still infrastructure.

For CDK, review `cdk diff` and synthesized CloudFormation. For Terraform, review `terraform plan` and the generated HCL.

The review should focus on resource creation, IAM permissions, public access, auth settings, outputs, tags, and state ownership.
