# Solution: Choose Workspace IaC

The full-stack product team uses CDK because it is TypeScript-oriented and AWS-focused. The team should inspect CDK diff and synthesized CloudFormation before deployment.

The platform agent team uses Terraform because it wants infrastructure in Terraform. The team should inspect Terraform plan, provider configuration, variables, outputs, and state backend assumptions.

In both cases, scaffolding does not remove the need to review IAM, auth, environment configuration, resource naming, and deployment ownership.
