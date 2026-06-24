# Solution: Combine Helm and Kustomize Safely

Helm should own:

- chart structure
- reusable Kubernetes resources
- default values
- chart version
- schema validation

Kustomize should own:

- environment overlays
- namespace
- environment labels
- image tag promotion
- replica and resource patches
- ingress host patches

Fields that should not be changed in both places:

- image tag
- replicas
- resources
- ingress host
- environment variables

Rendered output should be reviewed in CI before merge, for example by rendering Helm first and then rendering Kustomize overlays against that output.

The artifact repository should store immutable chart packages and Docker images. Git should store the desired deployment configuration.

