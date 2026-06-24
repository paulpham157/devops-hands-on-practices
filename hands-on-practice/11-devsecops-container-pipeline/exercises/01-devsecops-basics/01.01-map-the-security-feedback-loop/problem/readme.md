# Problem: Map the Security Feedback Loop

Read the lesson scripts:

```bash
ls scripts
sed -n '1,200p' scripts/security-gate.sh
```

Create a table with these columns:

```text
Stage | Script | Risk it catches | Should it block a PR?
```

Fill one row for each script:

- `lint-dockerfile.sh`
- `scan-secrets.sh`
- `scan-filesystem.sh`
- `scan-image.sh`
- `generate-sbom.sh`

Then decide which checks should block pull requests by default and which should start as report-only.
