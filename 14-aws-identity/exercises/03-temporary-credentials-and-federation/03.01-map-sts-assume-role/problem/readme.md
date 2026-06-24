# Problem: Map STS AssumeRole

Read:

```bash
sed -n '1,220p' policies/trust-policies/cross-account-audit-trust.json
```

Answer:

1. Which role is trusted?
2. Which STS action is allowed?
3. Why is `sts:ExternalId` useful?
4. After the role is assumed, where are the allowed actions defined?
