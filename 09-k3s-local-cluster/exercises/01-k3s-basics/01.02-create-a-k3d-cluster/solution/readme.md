# Create a k3d Cluster

Expected commands:

```bash
cd 09-k3s-local-cluster
./scripts/create-cluster.sh
```

Expected checks:

```bash
kubectl get nodes -o wide
k3d cluster list
```

The kubectl context should be:

```text
k3d-docker-course-k3s
```

If port `8089` is already used, create the cluster with a different port:

```bash
HTTP_PORT=8099 ./scripts/create-cluster.sh
HTTP_PORT=8099 ./scripts/test-app.sh
```
