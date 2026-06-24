# Understand AWS CDK Synthesis

1. `new Bucket(this, "TrainingBucket", ...)`.
2. `blockPublicAccess`, `encryption`, and `versioned`.
3. `this.node.tryGetContext("environmentName") ?? "dev"`.
4. CDK synthesizes a CloudFormation template.
5. Constructs can generate multiple resources and IAM statements, so the generated diff/template is the real deployment artifact.

