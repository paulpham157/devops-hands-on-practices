# Read a Pulumi Program

1. `new aws.s3.BucketV2("trainingBucket", ...)`.
2. Versioning, encryption, and public access block resources depend on `bucket.id`.
3. `bucketName`.
4. Helper functions, conditionals, loops, or side effects can hide infrastructure changes.
5. `pulumi preview`.

