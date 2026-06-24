# Create a k3d Cluster

## Task

Create the cluster:

```bash
cd hands-on-practice/09-k3s-local-cluster
./scripts/create-cluster.sh
```

Then inspect it:

```bash
kubectl get nodes -o wide
k3d cluster list
docker ps --filter name=docker-course-k3s
```

## Done When

You can see one server node, one agent node, and the k3d load balancer container.
