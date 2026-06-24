# Create a k3d Cluster

The cluster script creates:

```text
1 server node
1 agent node
1 k3d load balancer
```

The important port mapping is:

```text
8089 on localhost -> 80 on the k3d load balancer
```

That mapping lets you curl the Traefik Ingress from your host machine.
