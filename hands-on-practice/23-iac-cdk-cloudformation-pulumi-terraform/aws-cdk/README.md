# AWS CDK Example

AWS CDK lets you model AWS infrastructure with programming languages. The CDK app synthesizes a CloudFormation template, and CloudFormation remains the deployment engine.

## Read First

- `app.ts` defines a small stack.
- The stack creates an encrypted, versioned S3 bucket with public access blocked.
- In a real environment, `cdk synth` would produce CloudFormation output.

## Review Habit

Do not treat CDK code review as enough. Review both:

- the construct code.
- the synthesized CloudFormation template or diff.

