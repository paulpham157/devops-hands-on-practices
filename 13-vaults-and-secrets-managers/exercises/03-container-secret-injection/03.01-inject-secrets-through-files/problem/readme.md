# Problem: Inject Secrets Through Files

Run:

```bash
./scripts/write-vault-secret.sh
./scripts/export-compose-secret.sh
./scripts/run-app.sh
```

In another terminal:

```bash
curl http://localhost:8100
```

Answer:

1. Which local file is generated?
2. Which container path receives the secret?
3. Does the app print the full token?
4. Why is masking useful but not a complete security control?
