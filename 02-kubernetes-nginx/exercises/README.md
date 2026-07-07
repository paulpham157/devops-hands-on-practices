# Kubernetes Nginx Exercises

These exercises extend lesson 02. Use any local Kubernetes cluster, then apply the manifests:

```bash
cd 02-kubernetes-nginx
kubectl apply -f manifests/
```

## Exercise Order

1. Scale the Deployment from `2` replicas to `3` and watch the rollout.
2. Change the ConfigMap HTML and confirm the served page changes after the pods reload.
3. Break the image tag intentionally, inspect `ImagePullBackOff`, then restore the valid image.
4. Read the Service and explain how port `80` routes to container port `8080`.
5. Read the NetworkPolicy and describe which ingress traffic is allowed.

## Completion Rule

Finish each exercise only after checking Kubernetes state:

```text
edit manifest -> kubectl apply -> kubectl get/describe/logs -> curl or port-forward
```
