# Explainer: Read Base and Overlays

Kustomize starts from plain Kubernetes YAML and applies transformations.

This lesson uses:

```text
kustomize/base/
kustomize/overlays/dev/
kustomize/overlays/prod/
```

The base contains common resources. Overlays adjust those resources for an environment.

Common overlay changes:

- namespace
- labels
- replica count
- image tag
- resources
- ingress host
- ConfigMap values

Kustomize does not need template syntax. It keeps the YAML close to what Kubernetes actually receives.

