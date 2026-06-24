# Kubernetes Workload Portability

1. `Deployment`.
2. `Service`.
3. `allowPrivilegeEscalation: false`, `runAsNonRoot: true`, and dropping Linux capabilities.
4. It uses standard Kubernetes APIs instead of provider-specific extensions for external exposure.
5. OpenShift, GKE, EKS, and AKS can run this workload model directly.

