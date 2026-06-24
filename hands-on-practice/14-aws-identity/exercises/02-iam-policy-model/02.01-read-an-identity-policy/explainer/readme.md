# Explainer: Read an Identity Policy

An identity policy answers what an identity can do.

Important fields:

- `Effect`: `Allow` or `Deny`
- `Action`: API actions
- `Resource`: target resources
- `Condition`: extra requirements

AWS denies by default. An action needs an allow, and any explicit deny wins.

Use:

```bash
./scripts/explain-policy.sh policies/identity-policies/s3-read-only.json
```
