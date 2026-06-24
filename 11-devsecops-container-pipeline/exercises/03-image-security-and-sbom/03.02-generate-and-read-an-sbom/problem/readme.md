# Problem: Generate and Read an SBOM

Run:

```bash
./scripts/build-image.sh
./scripts/generate-sbom.sh
```

Inspect:

```bash
python3 -m json.tool reports/devsecops-sbom.cdx.json | sed -n '1,120p'
```

Answer:

1. Which SBOM format is generated?
2. Which file stores the SBOM?
3. Find one Python package listed in the SBOM.
4. How would an SBOM help after a new CVE is announced?
