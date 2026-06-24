# Compare Service Types

Kubernetes has several Service exposure patterns:

- `ClusterIP`: internal cluster address.
- `NodePort`: exposes a fixed high port on nodes.
- `LoadBalancer`: asks the environment for an external load balancer.
- `Ingress`: HTTP routing layer that points to Services.

K3s includes ServiceLB so `LoadBalancer` Services can work in small environments. In k3d, host access still depends on Docker port mappings created when the cluster starts.
