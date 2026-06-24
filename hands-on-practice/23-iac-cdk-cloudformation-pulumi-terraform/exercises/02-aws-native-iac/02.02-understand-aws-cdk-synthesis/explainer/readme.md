# Understand AWS CDK Synthesis

AWS CDK source code is not the deployed artifact. CDK evaluates constructs and produces CloudFormation.

The workflow is:

```text
CDK code -> cdk synth -> CloudFormation template -> cdk deploy -> CloudFormation stack
```

This means CDK review should include the generated template or `cdk diff`, especially for IAM permissions, replacements, and security-sensitive defaults.

