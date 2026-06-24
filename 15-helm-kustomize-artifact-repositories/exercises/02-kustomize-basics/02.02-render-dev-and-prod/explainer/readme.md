# Explainer: Render Dev and Prod

Kustomize rendering creates final Kubernetes YAML for one overlay.

```bash
kubectl kustomize kustomize/overlays/dev
kubectl kustomize kustomize/overlays/prod
```

This lesson wraps those commands:

```bash
./scripts/render-kustomize.sh dev
./scripts/render-kustomize.sh prod
```

Comparing rendered output is a good way to review environment drift.

