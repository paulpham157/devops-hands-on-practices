# Update ConfigMap HTML

After editing the ConfigMap, run:

```bash
kubectl apply -f manifests/01-configmap.yaml
kubectl rollout restart deployment/course-nginx -n docker-course
kubectl rollout status deployment/course-nginx -n docker-course
kubectl port-forward -n docker-course svc/course-nginx 8080:80
```

Then:

```bash
curl -fsS http://localhost:8080
```

The output should include the updated HTML.
