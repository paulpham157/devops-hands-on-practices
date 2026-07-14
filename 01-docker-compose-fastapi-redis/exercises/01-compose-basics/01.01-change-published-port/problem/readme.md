# Change Published Port

## Task

Edit `compose.yaml` and change the web service port mapping from:

```yaml
- "5001:5000"
```

to:

```yaml
- "8081:5000"
```

Recreate the stack:

```bash
docker compose up --build
```

## Done When

`curl http://localhost:8081` returns the page and the Redis-backed counter still increments.
