# Solution: Create a k3d Cluster

The default cluster name is:

```text
docker-course-argocd
```

The default local HTTP port is:

```text
8099
```

k3d runs K3s inside Docker containers.

This is safer for a course lab because cleanup is just deleting the k3d cluster instead of removing a host-level Kubernetes service from your workstation.
