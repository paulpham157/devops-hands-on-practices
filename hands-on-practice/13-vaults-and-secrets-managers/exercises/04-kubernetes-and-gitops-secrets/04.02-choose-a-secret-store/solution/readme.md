# Solution: Choose a Secret Store

1. Kubernetes Secret, with encryption at rest and RBAC. Risk: base64 is not encryption.
2. AWS Secrets Manager. Risk: IAM policies and rotation behavior must be designed.
3. HashiCorp Vault. Risk: operational complexity and availability.
4. Sealed Secrets or SOPS. Risk: encryption key management.
5. CI/CD secret store. Risk: workflow permissions and log leakage.

The best answer depends on existing identity, audit, rotation, and operational maturity.
