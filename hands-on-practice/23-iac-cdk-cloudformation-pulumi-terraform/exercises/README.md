# Exercises: AWS CDK, CloudFormation, Pulumi, and Terraform Extension Patterns

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-iac-foundations/01.01-compare-iac-models`
   - Compare template-based, code-based, and declarative IaC.

2. `01-iac-foundations/01.02-state-and-drift`
   - Understand state ownership, drift, import, and reconciliation.

3. `02-aws-native-iac/02.01-read-cloudformation-template`
   - Read an AWS-native CloudFormation template.

4. `02-aws-native-iac/02.02-understand-aws-cdk-synthesis`
   - Explain how CDK code becomes CloudFormation.

5. `03-multicloud-iac/03.01-read-pulumi-program`
   - Read a Pulumi program and identify resource dependencies.

6. `03-multicloud-iac/03.02-extend-terraform-with-modules`
   - Extend Terraform by wrapping resources in a reusable module.

7. `04-production-iac/04.01-plan-preview-change-review`
   - Review planned changes before deployment.

8. `04-production-iac/04.02-choose-iac-tool-for-team`
   - Choose a tool for realistic team and platform constraints.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
```

Then inspect:

```text
cloudformation/
aws-cdk/
pulumi/
terraform/
platform-maps/
scenario-designs/
```

No cloud credentials are required.

