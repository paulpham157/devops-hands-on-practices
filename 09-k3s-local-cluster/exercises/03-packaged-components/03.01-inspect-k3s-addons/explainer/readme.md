# Inspect K3s AddOns

K3s is batteries-included. It deploys several AddOns automatically.

Important default components:

- CoreDNS for cluster DNS.
- Traefik for Ingress.
- ServiceLB for LoadBalancer Services.
- local-path-provisioner for local persistent volumes.
- metrics-server for resource metrics.
- NetworkPolicy controller for policy enforcement.

These defaults are a big reason K3s is convenient for small clusters.
