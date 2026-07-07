# Update ConfigMap HTML

## Task

Edit `manifests/01-configmap.yaml` and change the HTML message.

Apply the manifests and restart the Deployment:

```bash
kubectl apply -f manifests/
kubectl rollout restart deployment/course-nginx -n docker-course
```

Port-forward the Service and inspect the page.

## Done When

The served HTML shows your new message.
