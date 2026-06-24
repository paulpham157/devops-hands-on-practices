# Problem: Run the Security Gate

Run:

```bash
./scripts/security-gate.sh
```

Then read:

```bash
sed -n '1,220p' scripts/security-gate.sh
```

Answer:

1. Which checks can fail the default gate?
2. Which check is report-only by default?
3. How do you make critical image vulnerabilities fail the gate?
4. Why should a team define policy before enforcing every scanner result?
