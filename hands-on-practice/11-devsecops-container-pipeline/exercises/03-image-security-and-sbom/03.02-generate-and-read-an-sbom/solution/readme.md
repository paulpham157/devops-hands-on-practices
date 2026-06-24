# Solution: Generate and Read an SBOM

The generated format is:

```text
CycloneDX JSON
```

The output file is:

```text
reports/devsecops-sbom.cdx.json
```

Expected components include runtime packages from the Python base image, such as:

```text
python3
openssl
```

After a new CVE is announced, an SBOM helps identify whether the affected package and version are present in an image or release.
