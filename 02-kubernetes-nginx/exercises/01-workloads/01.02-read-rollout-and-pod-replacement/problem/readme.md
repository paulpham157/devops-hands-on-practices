# Read Rollout and Pod Replacement

## Task

Change replicas or another safe Deployment field, apply the manifests, then inspect:

```bash
kubectl rollout status deployment/course-nginx -n docker-course
kubectl get rs,pods -n docker-course
kubectl describe deployment course-nginx -n docker-course
```

Answer:

1. Which object owns the Pods directly?
2. Which command tells you whether the rollout completed?
3. What evidence shows old Pods were replaced?

## Done When

You can trace Deployment -> ReplicaSet -> Pod ownership and explain a normal rollout.
