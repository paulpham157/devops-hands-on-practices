# Compare IaC Models

Infrastructure as Code tools differ mostly in the contract they expose to the team.

CloudFormation uses templates. The template is the source of truth for an AWS stack.

AWS CDK uses code. The code is not deployed directly; it synthesizes CloudFormation.

Pulumi uses code. The Pulumi engine evaluates the program, compares it with Pulumi state, and calls providers.

Terraform/OpenTofu uses declarative HCL. The engine compares configuration with state and provider read results, then produces a plan.

The practical skill is to identify the review artifact: template, synthesized template, preview, or plan.

