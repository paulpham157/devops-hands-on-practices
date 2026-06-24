# Explainer: Install and Access Argo CD

Argo CD runs inside the cluster.

The install script creates the `argocd` namespace and applies the upstream install manifest:

```bash
./scripts/install-argocd.sh
```

The script uses server-side apply because the Argo CD install includes large CustomResourceDefinitions.

Access is local through port-forwarding:

```bash
./scripts/port-forward-ui.sh
```

Then open:

```text
https://localhost:8080
```
