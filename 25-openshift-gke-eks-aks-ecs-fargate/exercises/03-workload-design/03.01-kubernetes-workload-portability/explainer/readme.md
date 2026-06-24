# Kubernetes Workload Portability

A portable Kubernetes manifest keeps to common API objects and avoids unnecessary provider-specific add-ons.

The example in `kubernetes-manifests/` uses:

- Deployment
- Service
- standard container fields
- resource requests and limits
- security context

This makes it broadly portable across OpenShift, GKE, EKS, and AKS with only surrounding platform integration changes.

