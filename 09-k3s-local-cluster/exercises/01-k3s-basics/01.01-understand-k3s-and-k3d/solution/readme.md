# Understand K3s and k3d

Expected answers:

1. K3s is a lightweight Kubernetes distribution.
2. k3d runs K3s clusters in Docker containers.
3. The lesson uses k3d because it is easy to create and delete local lab clusters without installing a host-level K3s service.
4. Traefik handles Ingress by default.
5. local-path-provisioner provides the default local StorageClass.

Short explanation:

```text
K3s is the cluster distribution. k3d is the local Docker-based cluster launcher.
```
