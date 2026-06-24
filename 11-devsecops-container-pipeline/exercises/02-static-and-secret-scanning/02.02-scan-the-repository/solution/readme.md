# Solution: Scan the Repository

Trivy filesystem mode is:

```bash
trivy fs
```

`scan-filesystem.sh` enables:

```text
vuln, misconfig, secret
```

`scan-secrets.sh` defaults to `EXIT_CODE=1` because a detected secret should fail the gate and force investigation.

The scripts skip generated local directories:

```text
.trivy-cache
reports
```
