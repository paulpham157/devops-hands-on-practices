# Problem: Hit, Miss, and Invalidation

Run:

```bash
curl -fsS http://localhost:5190/product/7
curl -fsS http://localhost:5190/product/7
curl -fsS -X DELETE http://localhost:5190/cache/7
curl -fsS http://localhost:5190/product/7
```

Answer:

1. Which requests were hits?
2. Which requests were misses?
3. What did `DELETE /cache/7` remove?
4. Why can stale data happen even with Redis?
5. When is explicit invalidation better than waiting for TTL?

