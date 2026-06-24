# Solution: Publish Chart to Nexus or Artifactory

Example Nexus-style flow:

```bash
docker login nexus.company.example
docker build -t nexus.company.example/docker-hosted/course-web:1.0.0 .
docker push nexus.company.example/docker-hosted/course-web:1.0.0

helm package charts/course-web --destination artifacts
helm registry login nexus.company.example
helm push artifacts/course-web-0.1.0.tgz oci://nexus.company.example/helm-hosted
```

Example Artifactory-style flow:

```bash
docker login artifactory.company.example
docker build -t artifactory.company.example/docker-local/course-web:1.0.0 .
docker push artifactory.company.example/docker-local/course-web:1.0.0

helm package charts/course-web --destination artifacts
helm registry login artifactory.company.example
helm push artifacts/course-web-0.1.0.tgz oci://artifactory.company.example/helm-local
```

Credential rule:

```text
Kubernetes and GitOps controllers should use read-only credentials.
CI release jobs can publish, but regular deployment credentials should not.
```

Retention or promotion rule:

```text
Delete old dev builds after a fixed retention window, but keep promoted release artifacts immutable.
```

