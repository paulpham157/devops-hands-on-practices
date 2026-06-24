# Compare Service Types

Expected answers:

1. The Service type is `ClusterIP`.
2. The app is reachable because localhost traffic is mapped to the k3d load balancer, then routed by Traefik Ingress to the internal Service.
3. Traefik receives the HTTP request before the app Service.

This is a common production-style pattern:

```text
Ingress controller at the edge
ClusterIP Services behind it
Pods behind Services
```
