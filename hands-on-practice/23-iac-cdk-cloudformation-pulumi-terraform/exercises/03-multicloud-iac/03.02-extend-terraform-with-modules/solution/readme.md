# Extend Terraform with Modules

1. `environment_name`.
2. `tags`.
3. Bucket, versioning, server-side encryption, and public access block resources.
4. Add a boolean such as `versioning_enabled`, then map it to the versioning status.
5. A module centralizes defaults, review, versioning, and fixes. Copy-paste spreads drift and makes policy changes harder.

