# Persist Redis Data

Expected Compose shape:

```yaml
redis:
  image: redis:7-alpine
  volumes:
    - redis-data:/data

volumes:
  redis-data:
```

Verify:

```bash
curl -fsS http://localhost:5001 >/dev/null
docker compose exec redis redis-cli get page_hits
docker compose down
docker compose up -d
docker compose exec redis redis-cli get page_hits
```
