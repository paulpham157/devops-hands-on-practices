# Problem: Run a Vault Dev Server

Run:

```bash
./scripts/up-vault.sh
```

Inspect:

```bash
docker compose ps
docker compose logs vault --tail=40
```

Answer:

1. Which Docker image runs Vault?
2. Which local port exposes the Vault API and UI?
3. What is the dev root token?
4. Why is dev mode unsafe for production?
