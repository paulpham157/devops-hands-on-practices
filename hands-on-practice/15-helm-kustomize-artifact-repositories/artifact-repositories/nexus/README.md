# Sonatype Nexus Repository Design Notes

Nexus Repository is commonly used as a central artifact repository for build outputs and upstream dependency caches.

In a Kubernetes delivery workflow, Nexus can be used for:

- Docker images
- Helm chart packages
- Maven, npm, PyPI, NuGet, and other language packages
- Release binaries
- Cached upstream dependencies

## Repository Pattern

Use separate repositories by artifact type and lifecycle.

| Repository | Mode | Purpose |
| --- | --- | --- |
| `docker-hosted` | hosted | Internal Docker images produced by CI |
| `dockerhub-proxy` | proxy | Cached Docker Hub pulls |
| `docker-group` | group | One pull endpoint for internal and proxied images |
| `helm-hosted` | hosted | Internal Helm chart packages |
| `helm-proxy` | proxy | Cached upstream Helm chart repository |
| `helm-group` | group | One Helm repository endpoint for internal and proxied charts |
| `maven-releases` | hosted | Immutable release packages |
| `maven-snapshots` | hosted | Mutable development snapshots |

## Why Group Repositories Matter

Developers and CI systems should not need to remember many upstream URLs.

Instead of this:

```text
docker pull nginx:1.27
docker pull registry.company.example/course-web:1.0.0
```

Prefer this:

```text
docker pull nexus.company.example/docker-group/nginx:1.27
docker pull nexus.company.example/docker-group/course-web:1.0.0
```

The group endpoint lets the platform team change upstream sources without changing every pipeline.

## Helm Chart Flow

Classic Helm chart repository flow:

```text
helm package charts/course-web
upload course-web-0.1.0.tgz to helm-hosted
helm repo add internal https://nexus.company.example/repository/helm-group
helm upgrade --install course-web internal/course-web --version 0.1.0
```

OCI registry flow, when the repository supports it:

```text
helm registry login nexus.company.example
helm push artifacts/course-web-0.1.0.tgz oci://nexus.company.example/helm-hosted
helm upgrade --install course-web oci://nexus.company.example/helm-hosted/course-web --version 0.1.0
```

## Docker Image Flow

```text
docker login nexus.company.example
docker build -t nexus.company.example/docker-hosted/course-web:1.0.0 .
docker push nexus.company.example/docker-hosted/course-web:1.0.0
```

Production deployments should reference immutable release tags or digests.

## Access Control

Typical permissions:

| Actor | Permission |
| --- | --- |
| Developer workstation | read from group repos |
| CI build job | write to hosted dev/snapshot repos |
| CI release job | write to release repos |
| Kubernetes cluster | read from Docker image group repo |
| GitOps controller | read Helm chart repo, if charts are pulled directly |

Avoid giving broad admin credentials to CI jobs.

## Operational Rules

- Separate dev/snapshot artifacts from release artifacts.
- Use retention policies for old snapshots and build caches.
- Prefer immutable release versions.
- Mirror critical upstream dependencies through proxy repositories.
- Make repository credentials scoped and revocable.
- Record the artifact version used by each deployment.
- Do not rely on local machine artifacts for deployment.

