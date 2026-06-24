# Problem: Create a k3d Cluster

Run:

```bash
./scripts/create-cluster.sh
```

Then inspect:

```bash
kubectl get nodes -o wide
kubectl get pods -A
```

Answer:

1. What is the default cluster name?
2. Which local HTTP port does the cluster use?
3. Which Kubernetes distribution is running inside k3d?
4. Why is this safer than installing K3s directly on your workstation?
