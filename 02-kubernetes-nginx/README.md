# Lesson 02: Kubernetes Nginx Deployment

## Goal

Deploy an unprivileged Nginx container to a local Kubernetes cluster and expose it through a Service.

This lesson uses `nginxinc/nginx-unprivileged` so the pod can run as a non-root user on port `8080`.

## Navigation

- Previous lesson: `01-docker-compose-flask-redis`
- Next lesson: `03-ansible-docker-host`

## Related Lessons

- `01-docker-compose-flask-redis`
- `03-ansible-docker-host`
- `09-k3s-local-cluster`

## Prerequisites

Use one local Kubernetes option:

- Docker Desktop Kubernetes
- kind
- minikube

Check access:

```bash
kubectl cluster-info
kubectl get nodes
```

## Apply

```bash
cd 02-kubernetes-nginx
kubectl apply -f manifests/
```

## Verify

```bash
kubectl get all -n docker-course
kubectl rollout status deployment/course-nginx -n docker-course
kubectl describe deployment course-nginx -n docker-course
kubectl logs -n docker-course deploy/course-nginx
```

Forward the service to your machine:

```bash
kubectl port-forward -n docker-course svc/course-nginx 8080:80
```

Open:

```text
http://localhost:8080
```

## Practice Tasks

1. Change replicas from `2` to `3`.
2. Change the ConfigMap HTML and apply again.
3. Watch the rollout with `kubectl get pods -n docker-course -w`.
4. Break the image tag intentionally, observe `ImagePullBackOff`, then fix it.
5. Read the NetworkPolicy and explain which traffic is allowed.

## Clean Up

```bash
kubectl delete -f manifests/
```

