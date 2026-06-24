# Exercises: K3s Local Cluster

## Sections

1. `01-k3s-basics`
   - Understand K3s and k3d.
   - Create a local K3s cluster.

2. `02-networking-and-ingress`
   - Route traffic through K3s' default Traefik Ingress.
   - Compare ClusterIP, LoadBalancer, NodePort, and Ingress.

3. `03-packaged-components`
   - Inspect K3s packaged AddOns.
   - Use the local-path StorageClass.

4. `04-operations`
   - Scale and roll out the demo app.

## Completion Target

By the end, you should be able to explain:

- Why K3s is useful for small clusters and local labs.
- How k3d runs K3s nodes inside Docker containers.
- How localhost traffic reaches an app through k3d and Traefik.
- Which K3s AddOns are installed by default.
- How to safely deploy, inspect, scale, and clean up a K3s lab.
