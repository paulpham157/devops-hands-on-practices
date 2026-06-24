# Explainer: Generate and Read an SBOM

An SBOM is a software bill of materials.

It lists components inside software so teams can answer questions like:

- Which package versions are in this image?
- Are we affected by a new vulnerability advisory?
- Which images need rebuilds?
- What did we ship in a release?

Generate the SBOM:

```bash
./scripts/generate-sbom.sh
```

This lesson writes a CycloneDX JSON SBOM to `reports/devsecops-sbom.cdx.json`.
