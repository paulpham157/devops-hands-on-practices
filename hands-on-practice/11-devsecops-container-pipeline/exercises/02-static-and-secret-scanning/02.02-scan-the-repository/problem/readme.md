# Problem: Scan the Repository

Run:

```bash
./scripts/scan-filesystem.sh
./scripts/scan-secrets.sh
```

Then inspect the scripts:

```bash
sed -n '1,220p' scripts/scan-filesystem.sh
sed -n '1,220p' scripts/scan-secrets.sh
```

Answer:

1. Which Trivy mode scans local files?
2. Which scanners are enabled in `scan-filesystem.sh`?
3. Why does `scan-secrets.sh` default to `EXIT_CODE=1`?
4. Which directories are skipped?
