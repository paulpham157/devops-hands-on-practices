# Explainer: Translate the Gate to CI

The best local DevSecOps scripts are boring to move into CI.

This lesson keeps CI simple:

```text
checkout code -> run ./scripts/security-gate.sh -> upload SBOM
```

The example workflow is:

```text
ci/github-actions-devsecops.yml
```

In a real repository, copy it to:

```text
.github/workflows/devsecops-container-pipeline.yml
```

Keeping the logic in scripts avoids duplicating security behavior across local development and CI.
