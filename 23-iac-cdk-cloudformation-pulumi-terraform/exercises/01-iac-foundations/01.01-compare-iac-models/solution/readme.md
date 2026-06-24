# Compare IaC Models

| Tool | Input Style | Deployment Engine | Review Artifact | Main Risk |
| --- | --- | --- | --- | --- |
| CloudFormation | YAML or JSON template | CloudFormation | template and change set | verbose templates and AWS-only scope |
| AWS CDK | programming language constructs | CloudFormation | CDK diff and synthesized template | generated changes hidden behind code |
| Pulumi | programming language resources | Pulumi engine plus providers | Pulumi preview | code side effects and state ownership |
| Terraform/OpenTofu | HCL | Terraform/OpenTofu engine plus providers | plan output | state, provider, and module complexity |

Answers:

1. AWS CDK can hide the most generated output because constructs synthesize CloudFormation.
2. Pulumi and Terraform/OpenTofu manage state outside the cloud provider control plane.
3. CloudFormation is the most AWS-native.

