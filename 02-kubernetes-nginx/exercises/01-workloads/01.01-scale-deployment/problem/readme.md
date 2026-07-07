# Scale Deployment

## Task

Edit `manifests/03-deployment.yaml` and change replicas from `2` to `3`.

Apply and watch:

```bash
kubectl apply -f manifests/
kubectl get pods -n docker-course -w
```

## Done When

`kubectl get deploy course-nginx -n docker-course` shows `3/3` ready replicas.
