# Trace Service Names and Startup Order

## Task

Read `compose.yaml` and answer:

1. Which service name should the FastAPI app use to reach Redis?
2. Why would `localhost` be wrong from inside the `web` container?
3. What does `depends_on` help with in this lesson?
4. What does `depends_on` not guarantee by itself?

Then verify network naming with:

```bash
docker compose up -d
docker compose exec web getent hosts redis
```

## Done When

You can explain service-to-service DNS in Compose and the difference between startup order and dependency readiness.
