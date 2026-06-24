# Problem: Understand SCP Guardrails

Run:

```bash
./scripts/explain-policy.sh policies/scp/deny-leaving-organization.json
./scripts/simulate-access.sh organizations:LeaveOrganization
./scripts/simulate-access.sh s3:GetObject
```

Answer:

1. Which action does the SCP deny?
2. Does an SCP grant `s3:GetObject`?
3. Why does explicit deny win?
4. Where should SCPs be managed?
