# Scale Deployment

The Deployment should include:

```yaml
spec:
  replicas: 3
```

Verify:

```bash
kubectl rollout status deployment/course-nginx -n docker-course
kubectl get pods -n docker-course -l app=course-nginx
```

Kubernetes should create one additional Pod without changing the Service.
