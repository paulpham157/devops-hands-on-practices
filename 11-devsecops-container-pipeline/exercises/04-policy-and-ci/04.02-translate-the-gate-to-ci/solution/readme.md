# Solution: Translate the Gate to CI

The workflow triggers on:

```text
pull_request
push to main
```

CI runs:

```bash
./scripts/security-gate.sh
```

It uploads:

```text
reports/devsecops-sbom.cdx.json
```

The workflow is stored under `ci/` because this repository is a learning workspace. Putting it directly under `.github/workflows/` would activate it in repositories that use GitHub Actions.
