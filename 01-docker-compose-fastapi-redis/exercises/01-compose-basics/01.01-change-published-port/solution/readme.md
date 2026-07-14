# Change Published Port

The `web` service should publish:

```yaml
ports:
  - "8081:5000"
```

Verify:

```bash
curl -fsS http://localhost:8081
docker compose exec redis redis-cli get page_hits
```

If `localhost:5001` still works, the old container may still be running. Stop the stack and start it again.
