# Solution: Choose the Right Tool

1. Helm. A reusable app package with values and versions is a chart-shaped problem.
2. Kustomize. Small environment differences are overlay-shaped.
3. Helm. Third-party Kubernetes apps are commonly distributed as charts.
4. Kustomize. The overlay keeps desired state readable in Git.
5. Helm. Chart packages can be versioned and published to an artifact repository.
6. Kustomize. A common label patch is a simple transformation.

Using both is valid when Helm owns the package and Kustomize owns environment-specific final shape. The key is to be explicit about which layer owns which change.

