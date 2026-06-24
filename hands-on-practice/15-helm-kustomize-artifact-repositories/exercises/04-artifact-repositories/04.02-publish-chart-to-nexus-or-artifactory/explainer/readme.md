# Explainer: Publish to Nexus or Artifactory

Publishing means moving a build output from CI into a managed artifact repository.

For this lesson, the important artifacts are:

- Docker image
- Helm chart package
- rendered deployment YAML for review
- optional SBOM or scan report

A safe release flow:

```text
test -> build -> scan -> package -> publish -> promote -> deploy
```

Nexus and Artifactory should not be treated as file dumps. They are release control points.

