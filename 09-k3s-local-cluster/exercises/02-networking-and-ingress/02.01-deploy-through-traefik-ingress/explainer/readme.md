# Deploy Through Traefik Ingress

K3s deploys Traefik by default. This lesson creates an Ingress that routes traffic to the `k3s-demo` Service.

Traffic path:

```text
localhost:8089
-> k3d load balancer
-> K3s node port 80
-> Traefik
-> ClusterIP Service
-> Nginx pod
```

The app Service remains internal. The Ingress is the external HTTP routing layer.
