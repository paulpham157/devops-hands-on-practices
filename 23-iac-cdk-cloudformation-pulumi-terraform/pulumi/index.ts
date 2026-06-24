import * as aws from "@pulumi/aws";
import * as pulumi from "@pulumi/pulumi";

const config = new pulumi.Config();
const environmentName = config.get("environmentName") ?? "dev";

const bucket = new aws.s3.BucketV2("trainingBucket", {
  tags: {
    Environment: environmentName,
    ManagedBy: "pulumi",
    Lesson: "iac-tooling",
  },
});

new aws.s3.BucketVersioningV2("trainingBucketVersioning", {
  bucket: bucket.id,
  versioningConfiguration: {
    status: "Enabled",
  },
});

new aws.s3.BucketServerSideEncryptionConfigurationV2("trainingBucketEncryption", {
  bucket: bucket.id,
  rules: [
    {
      applyServerSideEncryptionByDefault: {
        sseAlgorithm: "AES256",
      },
    },
  ],
});

new aws.s3.BucketPublicAccessBlock("trainingBucketPublicAccessBlock", {
  bucket: bucket.id,
  blockPublicAcls: true,
  blockPublicPolicy: true,
  ignorePublicAcls: true,
  restrictPublicBuckets: true,
});

export const bucketName = bucket.bucket;

