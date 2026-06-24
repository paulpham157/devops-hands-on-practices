# Deploy Through Traefik Ingress

## Task

Deploy and test the app:

```bash
cd 09-k3s-local-cluster
./scripts/deploy-app.sh
./scripts/test-app.sh
```

Then inspect:

```bash
kubectl get ingress -n docker-course-k3s
kubectl describe ingress k3s-demo -n docker-course-k3s
kubectl get svc k3s-demo -n docker-course-k3s
```

## Done When

`curl http://localhost:8089` returns the K3s demo page.
