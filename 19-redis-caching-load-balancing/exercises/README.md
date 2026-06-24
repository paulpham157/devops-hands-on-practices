# Exercises: Redis Caching and Load Balancing

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-redis-caching/01.01-cache-aside-and-ttl`
   - Understand cache-aside and TTL behavior.

2. `01-redis-caching/01.02-cache-hit-miss-invalidation`
   - Observe hit, miss, and explicit invalidation.

3. `02-load-balancing/02.01-nginx-round-robin-and-least-conn`
   - Read the NGINX upstream config and compare strategies.

4. `02-load-balancing/02.02-heavy-load-smoke-test`
   - Generate concurrent requests and inspect distribution.

5. `03-distributed-systems/03.01-avoid-hot-keys-and-cache-stampede`
   - Reason about hot keys, simultaneous expiry, and stampede mitigation.

6. `03-distributed-systems/03.02-design-cache-for-read-heavy-api`
   - Design a cache strategy for a read-heavy API.

7. `04-production-readiness/04.01-redis-memory-eviction-and-persistence`
   - Understand Redis memory policy and persistence choices.

8. `04-production-readiness/04.02-observability-and-failure-modes`
   - Identify metrics and failure-mode behavior.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
./scripts/start-stack.sh
./scripts/cache-demo.sh
./scripts/load-test.sh
./scripts/stats.sh
docker compose down --volumes
```

Generated load reports go to `reports/` and are ignored by git.

