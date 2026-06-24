# Problem: Avoid Plaintext in Git

Run:

```bash
./scripts/export-compose-secret.sh
git status --short
./scripts/scan-for-plaintext.sh
```

Answer:

1. Does `secrets/demo_api_token.txt` appear as an untracked file?
2. Which ignore rule protects generated secret files?
3. What should you do if a real token is committed?
4. Why is adding a file to `.gitignore` not enough after a secret was already committed?
