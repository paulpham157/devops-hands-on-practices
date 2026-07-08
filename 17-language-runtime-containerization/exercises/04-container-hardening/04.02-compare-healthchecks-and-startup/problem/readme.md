# Compare Healthchecks and Startup

## Task

Run all services:

```bash
docker compose up --build
./scripts/smoke-test.sh
```

Compare:

1. Which service is slowest to build?
2. Which service feels slowest to become ready?
3. Do all services expose `/healthz` consistently?
4. What healthcheck would you put into Compose or Kubernetes?

## Done When

You can propose one healthcheck command and one rollout consideration for each runtime group.
