# Plan, Preview, and Change Review

Every IaC tool needs a pre-apply review artifact:

- CloudFormation: change set.
- AWS CDK: `cdk diff` plus synthesized CloudFormation.
- Pulumi: `pulumi preview`.
- Terraform/OpenTofu: `terraform plan` or `tofu plan`.

The review should focus on creates, updates, deletes, replacements, IAM changes, public exposure, state movement, and cost-sensitive resources.

