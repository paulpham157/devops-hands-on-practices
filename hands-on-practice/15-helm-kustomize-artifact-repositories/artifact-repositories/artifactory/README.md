# JFrog Artifactory Design Notes

Artifactory is a universal artifact repository. It is commonly used as the binary source of truth between CI systems, security scanning, and deployment systems.

In a Kubernetes delivery workflow, Artifactory can store:

- Docker images
- Helm charts
- Build artifacts
- Language packages
- Release bundles and metadata
- Build info used for promotion and traceability

## Repository Pattern

Artifactory commonly uses local, remote, and virtual repositories.

| Repository | Mode | Purpose |
| --- | --- | --- |
| `docker-local` | local | Internal Docker images produced by CI |
| `dockerhub-remote` | remote | Cached Docker Hub pulls |
| `docker-virtual` | virtual | One Docker endpoint combining local and remote repos |
| `helm-local` | local | Internal Helm chart packages |
| `helm-remote` | remote | Cached upstream Helm chart repository |
| `helm-virtual` | virtual | One Helm endpoint combining local and remote repos |
| `generic-local` | local | Release archives, SBOMs, reports, and other build outputs |

## Why Virtual Repositories Matter

A virtual repository gives teams one stable URL while the platform team controls the backing local and remote repositories.

Example:

```text
docker pull artifactory.company.example/docker-virtual/nginx:1.27
docker pull artifactory.company.example/docker-virtual/course-web:1.0.0
```

This is easier to govern than every team pulling directly from public registries.

## Helm Chart Flow

Classic Helm chart repository flow:

```text
helm package charts/course-web
upload course-web-0.1.0.tgz to helm-local
helm repo add internal https://artifactory.company.example/artifactory/helm-virtual
helm upgrade --install course-web internal/course-web --version 0.1.0
```

OCI registry flow:

```text
helm registry login artifactory.company.example
helm push artifacts/course-web-0.1.0.tgz oci://artifactory.company.example/helm-local
helm upgrade --install course-web oci://artifactory.company.example/helm-local/course-web --version 0.1.0
```

## Docker Image Flow

```text
docker login artifactory.company.example
docker build -t artifactory.company.example/docker-local/course-web:1.0.0 .
docker push artifactory.company.example/docker-local/course-web:1.0.0
```

Production deployments should reference immutable release tags or image digests.

## Build Info and Promotion

Artifactory is often used with build metadata:

```text
CI build -> publish artifact -> attach build info -> scan -> promote -> deploy
```

This lets teams answer:

- Which source commit produced this artifact?
- Which dependency versions were included?
- Which pipeline published it?
- Which scan result approved it?
- Which environment currently runs it?

JFrog Xray is commonly paired with Artifactory for vulnerability and license scanning.

## Access Control

Typical permissions:

| Actor | Permission |
| --- | --- |
| Developer workstation | read from virtual repos |
| CI build job | write to local dev repos |
| CI release job | promote or write to release repos |
| Kubernetes cluster | read from Docker virtual repo |
| Security scanner | read artifacts and build metadata |

Keep deploy credentials read-only.

## Operational Rules

- Use local repositories for internal artifacts.
- Use remote repositories to cache upstream dependencies.
- Use virtual repositories as stable team endpoints.
- Preserve build info for release traceability.
- Promote tested artifacts instead of rebuilding for every environment.
- Scan before promotion to production.
- Use retention rules for old dev builds.
- Avoid mutable production tags.

