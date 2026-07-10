# Explainer: Choose Workspace IaC

The workspace can use CDK or Terraform for infrastructure.

Choose CDK when the team is AWS-focused, comfortable with TypeScript constructs, and willing to review synthesized CloudFormation.

Choose Terraform when the team already has Terraform modules, remote state, plan review, and policy workflows.

The right answer depends on the team's operational contract, not only on which syntax is more familiar.
