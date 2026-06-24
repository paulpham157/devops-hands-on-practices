# Solution: Classify Secret Stores

1. Docker Compose file secret or local env file.
2. AWS Secrets Manager.
3. HashiCorp Vault.
4. Kubernetes Secret, preferably sourced from an external secret store.
5. Sealed Secrets, SOPS, or External Secrets.
6. GitHub Actions secrets with tight workflow permissions.

The pattern is to keep the secret close to the identity and runtime that needs it, while still supporting audit and rotation.
