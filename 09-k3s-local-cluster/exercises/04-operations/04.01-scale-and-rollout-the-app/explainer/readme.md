# Scale and Roll Out the App

K3s uses the normal Kubernetes Deployment controller.

That means the same operational commands work:

```text
scale replicas
watch rollout
inspect ReplicaSets
roll back when needed
```

The lightweight distribution changes the cluster packaging, not the Kubernetes workload API.
