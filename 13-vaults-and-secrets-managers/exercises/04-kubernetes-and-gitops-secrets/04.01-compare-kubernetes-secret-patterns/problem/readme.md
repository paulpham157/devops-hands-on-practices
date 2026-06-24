# Problem: Compare Kubernetes Secret Patterns

Read:

```bash
sed -n '1,200p' kubernetes/native-secret.yaml
sed -n '1,220p' kubernetes/external-secret-vault.yaml
sed -n '1,200p' kubernetes/sealed-secret-placeholder.yaml
```

Answer:

1. Which file contains plaintext placeholder data?
2. Which file expects an external controller?
3. Which file stores encrypted data for GitOps?
4. Which pattern would you choose for Argo CD and why?
