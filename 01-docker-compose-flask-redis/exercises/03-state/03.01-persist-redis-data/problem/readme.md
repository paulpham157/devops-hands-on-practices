# Persist Redis Data

## Task

Add a named volume to `compose.yaml` and mount it into Redis:

```yaml
services:
  redis:
    volumes:
      - redis-data:/data

volumes:
  redis-data:
```

Generate a few page hits, run `docker compose down`, start the stack again, and check the counter.

## Done When

The counter survives `docker compose down` and resets only after `docker compose down --volumes`.
