# Explainer: Scan the Repository

Repository scanning looks at files before a container image exists.

This lesson uses Trivy filesystem mode for:

- Dependency manifests
- IaC and container configuration
- Secret patterns

Run:

```bash
./scripts/scan-filesystem.sh
./scripts/scan-secrets.sh
```

The secret scan is stricter by default because committed credentials require immediate action.
