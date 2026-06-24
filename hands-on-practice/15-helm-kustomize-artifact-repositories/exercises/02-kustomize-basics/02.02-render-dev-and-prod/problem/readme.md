# Problem: Render Dev and Prod

Run:

```bash
./scripts/render-kustomize.sh dev
./scripts/render-kustomize.sh prod
```

Then compare:

```bash
diff -u reports/kustomize-dev.yaml reports/kustomize-prod.yaml
```

Answer:

1. Which namespace does each overlay use?
2. Which image tag does each overlay use?
3. How many replicas does each overlay use?
4. Which overlay has larger resource requests or limits?
5. Which differences are expected, and which would be risky in production?

