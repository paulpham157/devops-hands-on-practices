# Solution: Run the Security Gate

The default gate can fail on:

- Dockerfile lint errors
- Secret scan findings
- Script or build failures

The image vulnerability scan is report-only by default.

To enforce critical image vulnerabilities:

```bash
IMAGE_VULN_GATE=1 ./scripts/security-gate.sh
```

A team should define policy first because scanners can produce noisy results. Good policy tells developers which findings block work, which require review, and which can be tracked as backlog.
