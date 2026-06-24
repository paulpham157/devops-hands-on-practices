# Read a CloudFormation Template

1. `TrainingBucket` with type `AWS::S3::Bucket`.
2. `PublicAccessBlockConfiguration`.
3. `VersioningConfiguration` with `Status: Enabled`.
4. `BucketArn` uses `Fn::GetAtt` for the bucket `Arn`.
5. Review naming, tags, encryption, public access settings, replacement behavior, IAM required to deploy, and whether any deletes or replacements appear in the change set.

