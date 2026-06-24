# Read a Pulumi Program

Pulumi programs are real programs. Resources can use variables, loops, helper functions, and package dependencies.

In `pulumi/index.ts`, the bucket is declared first, and the versioning, encryption, and public access block resources depend on `bucket.id`.

Pulumi previews changes before deployment and records resource state in a configured backend.

