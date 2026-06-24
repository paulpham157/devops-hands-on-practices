# Scale and Roll Out the App

Expected commands:

```bash
kubectl scale deployment/k3s-demo -n docker-course-k3s --replicas=3
kubectl rollout status deployment/k3s-demo -n docker-course-k3s
kubectl get pods -n docker-course-k3s
```

For ConfigMap changes mounted as files, restart the Deployment so new pods read the updated content:

```bash
kubectl rollout restart deployment/k3s-demo -n docker-course-k3s
kubectl rollout status deployment/k3s-demo -n docker-course-k3s
```

Return to the lesson baseline:

```bash
kubectl apply -f manifests/
```
