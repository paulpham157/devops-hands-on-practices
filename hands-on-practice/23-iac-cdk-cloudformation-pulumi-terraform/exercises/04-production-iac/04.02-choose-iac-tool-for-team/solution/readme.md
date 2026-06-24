# Choose an IaC Tool for a Team

1. AWS CDK. It fits TypeScript and reusable AWS constructs, but the team must review synthesized CloudFormation.
2. Terraform/OpenTofu or Pulumi. Terraform/OpenTofu fits declarative modules and provider breadth; Pulumi fits teams that prefer programming languages.
3. CloudFormation. It is AWS-native and uses AWS stack rollback, but templates can become verbose.
4. Terraform/OpenTofu. Existing state, module, and policy workflows are a strong reason to stay consistent.

The best choice is the one the team can review, operate, and debug consistently.

