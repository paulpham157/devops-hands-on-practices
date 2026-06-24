# Inspect K3s AddOns

Expected observations:

- Packaged system pods run in `kube-system`.
- The IngressClass is usually `traefik`.
- The default StorageClass is usually `local-path`.
- `metrics-server` should be visible in `kube-system`.

Useful commands:

```bash
kubectl get pods -n kube-system
kubectl get ingressclass
kubectl get storageclass
```
