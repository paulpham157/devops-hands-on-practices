import * as cdk from "aws-cdk-lib";
import { BlockPublicAccess, Bucket, BucketEncryption } from "aws-cdk-lib/aws-s3";
import { Construct } from "constructs";

class TrainingBucketStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    const environmentName = this.node.tryGetContext("environmentName") ?? "dev";

    const bucket = new Bucket(this, "TrainingBucket", {
      blockPublicAccess: BlockPublicAccess.BLOCK_ALL,
      encryption: BucketEncryption.S3_MANAGED,
      versioned: true,
    });

    cdk.Tags.of(bucket).add("Environment", environmentName);
    cdk.Tags.of(bucket).add("ManagedBy", "aws-cdk");
    cdk.Tags.of(bucket).add("Lesson", "iac-tooling");

    new cdk.CfnOutput(this, "BucketName", {
      value: bucket.bucketName,
    });
  }
}

const app = new cdk.App();
new TrainingBucketStack(app, "TrainingBucketStack");

