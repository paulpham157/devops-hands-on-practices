# Lesson 09: K3s Local Cluster with k3d

## Goal

Run a lightweight Kubernetes cluster with K3s and deploy a small web workload through K3s' default Traefik Ingress.

This lesson teaches:

- What K3s changes compared with a larger Kubernetes distribution
- How to run K3s locally with `k3d`
- K3s packaged components: CoreDNS, Traefik, ServiceLB, NetworkPolicy, metrics-server, and local-path storage
- How Ingress traffic reaches a workload through the k3d load balancer
- Basic operations: rollout, scale, inspect, and cleanup

## Why K3s

K3s is a lightweight Kubernetes distribution. It is useful for edge, homelab, CI, development, small VMs, and single-board computers.

Compared with a larger self-managed Kubernetes setup, K3s is simpler to bootstrap because it packages several useful defaults:

- Container runtime
- Flannel CNI
- CoreDNS
- Traefik Ingress controller
- ServiceLB LoadBalancer controller
- NetworkPolicy controller
- local-path persistent volume provisioner
- metrics-server

## Why k3d for This Lesson

K3s can be installed directly on a Linux VM or server, but this lesson uses `k3d` because it runs K3s nodes as Docker containers.

That gives a safe lab loop:

```text
create cluster -> deploy manifests -> test app -> delete cluster
```

No host-level K3s service is installed.

## Prerequisites

Install:

- Docker Desktop or Docker Engine
- `kubectl`
- `k3d`

Check:

```bash
docker version
kubectl version --client
k3d version
```

## Run

Create a local K3s cluster:

```bash
cd hands-on-practice/09-k3s-local-cluster
./scripts/create-cluster.sh
```

Deploy the app:

```bash
./scripts/deploy-app.sh
```

Test it through Traefik Ingress:

```bash
./scripts/test-app.sh
```

Default URL:

```text
http://localhost:8089
```

## What Gets Created

Cluster:

```text
k3d cluster: docker-course-k3s
1 K3s server container
1 K3s agent container
1 k3d load balancer container
host port 8089 -> cluster port 80
host port 8444 -> cluster port 443
```

Kubernetes resources:

```text
Namespace        docker-course-k3s
ConfigMap        k3s-demo-content
ServiceAccount   k3s-demo
Deployment       k3s-demo
Service          k3s-demo
Ingress          k3s-demo
NetworkPolicy    k3s-demo-ingress
```

## Inspect K3s Components

K3s deploys several packaged components into `kube-system`.

```bash
./scripts/inspect-addons.sh
```

Useful manual checks:

```bash
kubectl get pods -n kube-system
kubectl get ingressclass
kubectl get storageclass
kubectl get svc -n kube-system
```

Expected highlights:

- `traefik` handles Ingress.
- `local-path` is the default StorageClass.
- `coredns` provides cluster DNS.
- `metrics-server` provides resource metrics.

## Useful Commands

Check nodes:

```bash
kubectl get nodes -o wide
```

Watch rollout:

```bash
kubectl rollout status deployment/k3s-demo -n docker-course-k3s
```

Show resources:

```bash
kubectl get all,ingress,networkpolicy -n docker-course-k3s
```

Scale:

```bash
kubectl scale deployment/k3s-demo -n docker-course-k3s --replicas=3
kubectl rollout status deployment/k3s-demo -n docker-course-k3s
```

Read logs:

```bash
kubectl logs -n docker-course-k3s deploy/k3s-demo
```

Delete only the app:

```bash
kubectl delete -f manifests/
```

Delete the whole lab cluster:

```bash
./scripts/cleanup.sh
```

## Direct K3s Install Note

On a Linux VM or server, K3s is often installed directly with the official install script. Do not run host-level install commands on your main workstation unless you intentionally want a system service.

For this Docker course, prefer `k3d` for local practice and use direct K3s installation only on disposable Linux lab machines.

## Exercises

Use the exercise track after the first successful deployment:

```text
exercises/README.md
```

The exercises cover K3s vs k3d, cluster creation, Traefik Ingress, Service types, packaged AddOns, local-path storage, scaling, and rollouts.

## References

- K3s overview: https://docs.k3s.io/
- K3s packaged components: https://docs.k3s.io/installation/packaged-components
- K3s networking services: https://docs.k3s.io/networking/networking-services
- K3s cluster access: https://docs.k3s.io/cluster-access
- k3d cluster create: https://k3d.io/stable/usage/commands/k3d_cluster_create/
- k3d K3s features: https://k3d.io/stable/usage/k3s/
