# Lesson 15: Helm, Kustomize, and Artifact Repositories

## Goal

Learn how Helm, Kustomize, and artifact repositories fit together in a Kubernetes delivery workflow.

This lesson teaches:

- Helm chart structure and values
- Helm template rendering and chart packaging
- Kustomize base and overlays
- When to choose Helm, Kustomize, or both
- What artifact repositories store
- How Sonatype Nexus and JFrog Artifactory are commonly used for Docker images, Helm charts, and build artifacts
- Hosted, proxy, and group repository patterns
- How artifact repositories fit into CI/CD and GitOps

## Navigation

- Previous lesson: `14-aws-identity`
- Next lesson: `16-opentelemetry-jaeger-datadog`

## Related Lessons

- `12-argocd-gitops`
- `24-jfrog-artifactory`
- `25-openshift-gke-eks-aks-ecs-fargate`

## Mental Model

```text
source code -> build artifact -> publish artifact -> deploy desired state
```

For Kubernetes:

```text
Docker image        -> artifact repository / registry
Helm chart package  -> artifact repository / OCI registry
Kustomize manifests -> Git repository
GitOps controller   -> pulls desired state and deploys
```

Helm is mainly a packaging and templating tool.

Kustomize is mainly an overlay and patching tool.

Artifact repositories are systems of record for versioned binaries, images, charts, libraries, and release artifacts.

## Helm vs Kustomize

| Tool | Best For | Input | Output | Watch Out For |
| --- | --- | --- | --- | --- |
| Helm | Packaging reusable apps and parameterized installs | Chart templates and values | Rendered Kubernetes YAML | Over-templating and values sprawl |
| Kustomize | Environment overlays without templating | Base YAML plus patches | Rendered Kubernetes YAML | Patch drift and duplicated overlays |
| Artifact repository | Storing versioned build outputs | Images, charts, packages, binaries | Pullable immutable artifacts | Mutable tags and weak retention policy |

## Lab Layout

```text
charts/course-web/               Helm chart
kustomize/base/                  Plain Kubernetes base
kustomize/overlays/dev/          Dev overlay
kustomize/overlays/prod/         Prod overlay
artifact-repositories/nexus/     Nexus repository design notes
artifact-repositories/artifactory/ Artifactory repository design notes
scripts/                         Render, package, and validation helpers
reports/                         Generated rendered YAML, ignored by git
artifacts/                       Generated packaged charts, ignored by git
```

## Prerequisites and Entry Check

Install:

- `kubectl`
- Helm 3
- Optional: Docker, if you later want to run a local artifact repository

Check:

```bash
kubectl version --client
helm version
```

Entry check: explain the difference between rendering a Helm chart, applying a Kustomize overlay, and publishing an immutable artifact.

## Render the Helm Chart

```bash
cd 15-helm-kustomize-artifact-repositories
./scripts/render-helm.sh
```

Output:

```text
reports/helm-rendered.yaml
```

## Package the Helm Chart

```bash
./scripts/package-chart.sh
```

Output:

```text
artifacts/course-web-0.1.0.tgz
```

## Render Kustomize Overlays

```bash
./scripts/render-kustomize.sh dev
./scripts/render-kustomize.sh prod
```

Outputs:

```text
reports/kustomize-dev.yaml
reports/kustomize-prod.yaml
```

## Validate Everything

```bash
./scripts/validate.sh
```

The validation script checks:

- shell script syntax
- Helm chart lint/template/package when `helm` is installed
- Kustomize rendering through `kubectl kustomize`
- YAML parse for rendered output

## Artifact Repository Concepts

Artifact repositories usually provide three repository modes:

| Mode | Meaning | Example |
| --- | --- | --- |
| Hosted | Store your own internal artifacts | Your Helm charts, Docker images, Maven packages |
| Proxy | Cache upstream artifacts | Docker Hub, Maven Central, public Helm repos |
| Group / virtual | One URL that combines hosted and proxy repos | Developer pulls from one stable endpoint |

## Nexus vs Artifactory

| Product | Common Strengths | Typical Uses |
| --- | --- | --- |
| Sonatype Nexus Repository | Repository manager, proxy/group repos, Maven/npm/Docker/Helm support, OSS-friendly entry point | Central package cache, internal Docker/Helm repo, dependency governance with Sonatype ecosystem |
| JFrog Artifactory | Universal artifact repository, strong metadata/build-info model, deep JFrog platform integration | Enterprise binary management, build promotion, Docker/Helm/npm/Maven/PyPI, Xray scanning workflows |

Both can store Docker images and Helm charts. Both can sit between CI/CD systems and Kubernetes delivery.

## Example Publish Flows

Helm chart as classic chart repository:

```text
helm package charts/course-web
upload .tgz to Nexus or Artifactory Helm repository
helm repo add internal https://artifact.example.com/helm
helm install course-web internal/course-web --version 0.1.0
```

Helm chart as OCI artifact:

```text
helm package charts/course-web
helm registry login artifact.example.com
helm push artifacts/course-web-0.1.0.tgz oci://artifact.example.com/helm
helm install course-web oci://artifact.example.com/helm/course-web --version 0.1.0
```

For Helm OCI registries, the chart reference basename is inferred from the chart name and the tag is inferred from the chart semantic version. Do not use `latest` for Helm OCI charts.

Docker image:

```text
docker build -t artifact.example.com/docker/course-web:1.0.0 .
docker push artifact.example.com/docker/course-web:1.0.0
```

## Production Notes

For production:

- Prefer immutable version tags for releases.
- Do not deploy from local build artifacts.
- Use artifact retention policies.
- Separate snapshot/dev repositories from release repositories.
- Use repository permissions per team or pipeline.
- Scan images and packages before promotion.
- Keep provenance and build metadata.
- Avoid mutable `latest` for production deployments.
- Mirror critical upstream dependencies through proxy repositories.

## Exercises

Use the exercise track after rendering Helm and Kustomize once:

```text
exercises/README.md
```

The exercises cover chart structure, rendering, packaging, overlays, choosing Helm vs Kustomize, combining tools safely, repository modes, and publishing to Nexus or Artifactory.

## Cleanup

```bash
rm -rf reports/ artifacts/
```

These paths contain generated lesson output. Do not remove chart, Kustomize, or repository source files.

## References

- Helm documentation: https://helm.sh/docs/
- Helm chart template guide: https://helm.sh/docs/chart_template_guide/
- Helm registries and OCI: https://helm.sh/docs/topics/registries/
- Kustomize in Kubernetes docs: https://kubernetes.io/docs/tasks/manage-kubernetes-objects/kustomization/
- Sonatype Nexus Repository documentation: https://help.sonatype.com/en/sonatype-nexus-repository.html
- JFrog Artifactory documentation: https://jfrog.com/help/r/jfrog-artifactory-documentation
