# Problem: Read a Trust Policy

Inspect:

```bash
./scripts/explain-policy.sh policies/trust-policies/ec2-service-role-trust.json
./scripts/explain-policy.sh policies/trust-policies/github-actions-oidc-trust.json
```

Answer:

1. Which principal can assume the EC2 service role?
2. Which STS action does the EC2 role use?
3. Which provider is trusted by the GitHub Actions role?
4. Which condition restricts the GitHub repository and branch?
