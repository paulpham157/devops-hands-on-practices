# Extend Terraform with Modules

Modules are the most common and safest way to extend Terraform for a platform team.

A module gives repeated infrastructure a stable interface:

- inputs through variables.
- resources inside the module.
- outputs for consumers.

The sample module wraps a bucket, versioning, encryption, and public access blocking behind one reusable `tagged-s3-bucket` interface.

