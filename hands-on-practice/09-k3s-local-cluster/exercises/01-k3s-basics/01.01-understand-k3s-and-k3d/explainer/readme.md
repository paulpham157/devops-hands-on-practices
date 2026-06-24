# Understand K3s and k3d

K3s is Kubernetes packaged for smaller environments. It keeps the Kubernetes API and resource model, but simplifies installation and bundles useful defaults.

k3d is a wrapper that runs K3s nodes as Docker containers. It is useful for this course because you can create and delete a complete cluster without installing K3s as a host service.

Useful mental model:

```text
K3s = lightweight Kubernetes distribution
k3d = local tool that runs K3s clusters in Docker
kubectl = client that talks to the cluster API
```
