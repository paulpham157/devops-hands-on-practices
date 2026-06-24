# Lesson 23: AWS CDK, CloudFormation, Pulumi, and Terraform Extension Patterns

## Goal

Learn how major Infrastructure as Code tools model infrastructure:

- AWS CloudFormation: declarative AWS-native templates.
- AWS CDK: application code that synthesizes CloudFormation.
- Pulumi: general-purpose programming languages with Pulumi state and providers.
- Terraform/OpenTofu: declarative HCL, provider plugins, reusable modules, and state.

This lesson focuses on tool selection and production workflow, not cloud deployment. No AWS account or cloud credentials are required for the core exercises.

## Mental Model

```text
source code or template -> plan/diff/synth -> reviewed change -> apply/deploy -> state/drift control
```

The key question is not "which tool is best?" but "which contract does the team want?"

| Tool | Primary Contract | State Owner | Good Fit |
| --- | --- | --- | --- |
| CloudFormation | AWS template describes AWS resources | AWS CloudFormation stack state | AWS-only teams that want native AWS control plane behavior |
| AWS CDK | Code constructs synthesize CloudFormation templates | AWS CloudFormation stack state | AWS teams that want higher-level reusable constructs |
| Pulumi | Code defines resources through Pulumi providers | Pulumi backend or self-managed backend | Teams that want real programming languages and multi-cloud IaC |
| Terraform/OpenTofu | HCL declares resources through provider plugins | Local or remote Terraform/OpenTofu state | Teams that want broad provider ecosystem and declarative workflows |

## Lab Layout

```text
cloudformation/       AWS-native declarative template example
aws-cdk/              CDK app that synthesizes a similar CloudFormation stack
pulumi/               Pulumi TypeScript program for comparable resources
terraform/            Terraform root module, reusable module, and extension notes
platform-maps/        IaC comparison and decision notes
scenario-designs/     Architecture scenarios for tool choice practice
scripts/              Validation helper
exercises/            Structured hands-on practice
```

## What "Extending Terraform" Means

In real projects, extending Terraform usually means one of these patterns:

- create reusable modules for internal platforms.
- use or write provider plugins when Terraform does not support a target API.
- use provider aliases for multi-account or multi-region deployments.
- use external data sources only as a narrow integration escape hatch.
- generate or wrap HCL carefully, with reviewable output.
- use policy and validation around plans.

It rarely means modifying Terraform core. CDK for Terraform exists as a code-to-Terraform approach, but HashiCorp has announced CDKTF deprecation, so this lesson treats it as context rather than the main recommended path for new work.

## Local Examples

All examples model a small tagged S3 bucket-like workload:

```text
cloudformation/s3-bucket.yaml
aws-cdk/app.ts
pulumi/index.ts
terraform/main.tf
terraform/modules/tagged-s3-bucket/
```

They intentionally remain simple so you can compare expression style, lifecycle, and state behavior.

## Production Workflow

Use the same review loop regardless of tool:

1. Format and validate code.
2. Produce a plan, preview, diff, or synthesized template.
3. Review resource changes and IAM impact.
4. Apply through CI/CD with controlled credentials.
5. Record outputs and update runbooks.
6. Detect drift and reconcile intentionally.

## Tool Selection Heuristics

Choose CloudFormation when:

- the platform is AWS-only.
- native AWS support and stack events matter more than multi-cloud portability.
- the team is comfortable with YAML/JSON templates.

Choose AWS CDK when:

- the platform is AWS-only.
- the team wants reusable constructs and normal programming language abstractions.
- you are willing to review generated CloudFormation output.

Choose Pulumi when:

- the team wants TypeScript, Python, Go, C#, Java, or YAML for IaC.
- application developers will own infrastructure code.
- multi-cloud resources need a consistent programming model.

Choose Terraform/OpenTofu when:

- provider breadth and declarative workflows matter.
- platform teams need standardized reusable modules.
- the organization already has remote state, plan review, and policy workflows.

## Validate

From this lesson directory:

```bash
./scripts/validate.sh
```

This checks:

- required lesson files.
- shell script syntax.
- YAML syntax for CloudFormation and scenario files.
- Terraform/OpenTofu formatting when either CLI is installed.
- TypeScript/JSON syntax-light checks where possible.

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover IaC models, state and drift, CloudFormation, AWS CDK synthesis, Pulumi programs, Terraform modules and provider extension thinking, change review, and tool selection.

## References

- AWS CDK documentation: https://docs.aws.amazon.com/cdk/
- AWS CloudFormation User Guide: https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html
- Pulumi documentation: https://www.pulumi.com/docs/
- Terraform documentation: https://developer.hashicorp.com/terraform/docs
- Terraform plugin framework: https://developer.hashicorp.com/terraform/plugin
- Terraform modules documentation: https://developer.hashicorp.com/terraform/language/modules
- CDK for Terraform documentation and deprecation notice: https://developer.hashicorp.com/terraform/cdktf

