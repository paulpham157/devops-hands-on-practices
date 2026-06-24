# Problem: Publish Chart to Nexus or Artifactory

Draft commands or pseudocode for publishing:

1. Docker image `course-web:1.0.0`
2. Helm chart package `course-web-0.1.0.tgz`

Use either Nexus or Artifactory.

Your answer must include:

- registry login step
- immutable image tag
- chart package command
- chart publish command
- one read-only credential rule for Kubernetes or GitOps
- one retention or promotion rule

You can inspect examples with:

```bash
./scripts/artifact-command-examples.sh
```

