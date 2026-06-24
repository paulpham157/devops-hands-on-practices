# Problem: Heavy Load Smoke Test

Run:

```bash
./scripts/reset.sh
REQUESTS=90 CONCURRENCY=15 PRODUCT_ID=42 ./scripts/load-test.sh
./scripts/stats.sh
```

Answer:

1. How many hits did the report show?
2. How many misses did the report show?
3. Which app instances handled traffic?
4. Why can multiple misses happen at the beginning of a concurrent test?
5. What would change if each request used a random product ID?

