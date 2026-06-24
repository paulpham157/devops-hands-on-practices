# Scale and Roll Out the App

## Task

Scale the app:

```bash
kubectl scale deployment/k3s-demo -n docker-course-k3s --replicas=3
kubectl rollout status deployment/k3s-demo -n docker-course-k3s
kubectl get pods -n docker-course-k3s -o wide
```

Then change the ConfigMap HTML and apply again:

```bash
kubectl apply -f manifests/01-configmap.yaml
kubectl rollout restart deployment/k3s-demo -n docker-course-k3s
kubectl rollout status deployment/k3s-demo -n docker-course-k3s
```

## Done When

The app has three ready pods and the page still loads through Ingress.
