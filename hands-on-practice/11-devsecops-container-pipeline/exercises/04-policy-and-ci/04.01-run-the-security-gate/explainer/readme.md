# Explainer: Run the Security Gate

A security gate turns checks into a decision.

This lesson's gate runs:

```text
lint Dockerfile -> scan secrets -> scan filesystem -> build image -> scan image -> generate SBOM
```

Run:

```bash
./scripts/security-gate.sh
```

The gate is strict for Dockerfile lint and secrets. Image vulnerability findings are report-only by default so the lab does not break whenever advisory databases change.

To enforce critical image findings:

```bash
IMAGE_VULN_GATE=1 ./scripts/security-gate.sh
```
