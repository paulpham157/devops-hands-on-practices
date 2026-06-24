# Solution: Read Base and Overlays

The base defines:

- Namespace
- ConfigMap
- ServiceAccount
- Deployment
- Service
- Ingress

Both dev and prod overlays can change the image tag through `images`.

The overlays patch the Deployment for environment-specific replica and resource settings.

Kustomize is useful because the base remains valid Kubernetes-style YAML. Environment changes are expressed as patches and transformations instead of template conditionals.

