# Problem: Read an Identity Policy

Run:

```bash
./scripts/explain-policy.sh policies/identity-policies/s3-read-only.json
./scripts/simulate-access.sh s3:GetObject
./scripts/simulate-access.sh s3:DeleteObject
```

Answer:

1. Which action allows reading objects?
2. Which action allows listing the bucket?
3. Why is `s3:DeleteObject` denied?
4. Which resources are scoped by the policy?
