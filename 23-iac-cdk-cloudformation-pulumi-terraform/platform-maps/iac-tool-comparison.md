# IaC Tool Comparison

| Dimension | CloudFormation | AWS CDK | Pulumi | Terraform/OpenTofu |
| --- | --- | --- | --- | --- |
| Main syntax | YAML or JSON | TypeScript, Python, Java, C#, Go | TypeScript, Python, Go, C#, Java, YAML | HCL |
| Deployment engine | CloudFormation | CloudFormation | Pulumi engine plus providers | Terraform/OpenTofu engine plus providers |
| State | AWS stack state | AWS stack state | Pulumi backend | Terraform/OpenTofu state |
| Scope | AWS | AWS | Multi-cloud and SaaS providers | Multi-cloud and SaaS providers |
| Abstraction | Low to medium | Medium to high | Medium to high | Low to medium, higher with modules |
| Review artifact | Change set and template | CDK diff and synthesized template | Pulumi preview | Plan output |
| Strong point | AWS-native lifecycle | Reusable AWS constructs | Real language power | Provider ecosystem and declarative modules |
| Risk | Verbose templates | Hidden generated changes | Code side effects | State and provider complexity |

## Rule of Thumb

- If AWS native integration is the priority, compare CloudFormation and AWS CDK.
- If programming language ergonomics are the priority, compare AWS CDK and Pulumi.
- If broad provider support and platform standardization are the priority, compare Terraform/OpenTofu and Pulumi.
- If team review maturity is low, prefer explicit declarative code and small modules before higher abstractions.

