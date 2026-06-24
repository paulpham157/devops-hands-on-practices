# Explainer: Lint a Dockerfile

Dockerfile linting catches common build mistakes before an image exists.

Examples:

- Missing image tag
- Running as root
- Installing packages without pinning or cleanup
- Using brittle shell patterns
- Copying files too broadly

Linting is fast and deterministic, so it is a good pull request gate.

This lesson uses Hadolint through Docker:

```bash
./scripts/lint-dockerfile.sh
```
