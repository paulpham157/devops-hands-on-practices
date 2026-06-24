# Explainer: Create a k3d Cluster

This lesson uses k3d because it runs K3s nodes as Docker containers.

That gives a disposable cluster for GitOps practice:

```text
create cluster -> install Argo CD -> sync app -> delete cluster
```

The cluster maps host port `8099` to the K3s load balancer port `80`.

That lets the course web app be reached through:

```text
http://localhost:8099
```
