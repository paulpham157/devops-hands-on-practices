# Lesson 19: Redis Caching and Heavy Load Balancing for Distributed Systems

## Goal

Learn how Redis caching and load balancing help distributed systems handle read-heavy traffic.

This lesson teaches:

- Redis as an in-memory cache
- cache-aside pattern
- TTL and cache invalidation
- cache hit, miss, and stale data tradeoffs
- NGINX as a reverse proxy and load balancer
- round-robin and least-connections load balancing
- hot keys, cache stampede, and thundering herd risk
- memory limits, eviction policy, and persistence choices
- failure modes when Redis or backend services are unhealthy

## Mental Model

Without cache:

```text
client -> load balancer -> app -> slow origin/database
```

With Redis cache:

```text
client -> load balancer -> app -> Redis
                              |
                              v
                         slow origin on cache miss
```

Redis reduces repeated expensive work. The load balancer spreads incoming requests across app instances.

These solve different problems:

| Component | Solves |
| --- | --- |
| Redis cache | repeated reads, expensive origin calls, latency reduction |
| Load balancer | traffic distribution, backend failover, single entry point |
| App replicas | horizontal capacity |
| TTL | bounded staleness and automatic cleanup |

## Lab Layout

```text
app/              Flask API that uses Redis cache-aside
nginx/            NGINX load balancer config
redis/            Redis config for local learning
scripts/          start, load, stats, reset, and validation helpers
notes/            design notes and failure modes
exercises/        structured hands-on practice
reports/          generated load output, ignored by git
```

## Components

| Service | URL | Purpose |
| --- | ---: | --- |
| NGINX load balancer | http://localhost:5190 | Entry point for clients |
| app-a | internal | backend app replica |
| app-b | internal | backend app replica |
| app-c | internal | backend app replica |
| Redis | localhost:6379 | shared cache |

## Run

```bash
cd 19-redis-caching-load-balancing
./scripts/start-stack.sh
```

Warm one cache key:

```bash
curl -fsS http://localhost:5190/product/42
curl -fsS http://localhost:5190/product/42
```

The first request should be a cache miss. The second should be a cache hit until the TTL expires.

Generate load:

```bash
./scripts/load-test.sh
```

Inspect stats:

```bash
./scripts/stats.sh
```

Reset cache and counters:

```bash
./scripts/reset.sh
```

Stop:

```bash
docker compose down --volumes
```

## API Endpoints

| Endpoint | Purpose |
| --- | --- |
| `GET /` | service metadata |
| `GET /healthz` | health check |
| `GET /product/<id>` | read-through cache-aside demo |
| `DELETE /cache/<id>` | invalidate one cached product |
| `POST /cache/clear` | clear all lesson cache keys |
| `GET /stats` | local app counters and Redis cache counters |

The JSON response includes:

- backend instance name
- cache hit or miss
- key
- TTL
- simulated origin latency

## Cache-Aside Pattern

Cache-aside is a common pattern:

```text
1. Try Redis.
2. If cache hit, return cached value.
3. If cache miss, fetch from origin.
4. Store result in Redis with TTL.
5. Return result.
```

Pros:

- simple
- app controls cache keys and TTL
- works well for read-heavy data

Watch out for:

- stale data
- hot keys
- cache stampede
- invalidation bugs
- Redis outage behavior

## NGINX Load Balancing

The config is in:

```text
nginx/default.conf
```

Default strategy in this lesson:

```text
least_conn
```

That sends a new request to the backend with the fewest active connections.

For short requests, round-robin is often enough. For uneven request duration, least-connections can behave better.

## Redis Production Notes

For production:

- Set memory limits intentionally.
- Choose an eviction policy that matches the workload.
- Use TTLs for cache entries.
- Avoid unbounded key growth.
- Do not store secrets or source-of-truth data only in cache.
- Monitor hit ratio, evictions, memory, latency, and command rate.
- Plan for Redis outage behavior.
- Use connection pooling.
- Avoid hot keys where possible.
- Use request coalescing or locks for expensive cache misses.

## Load Balancing Production Notes

For production:

- Add health checks.
- Use timeouts.
- Limit request body size where appropriate.
- Configure retries carefully.
- Preserve request IDs.
- Understand sticky sessions before using them.
- Keep app instances stateless when possible.
- Scale app replicas independently from Redis.

## Validate

```bash
./scripts/validate.sh
```

This checks:

- shell script syntax
- Python syntax
- YAML syntax
- NGINX config file presence
- Docker Compose config when Docker is available

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover cache-aside, TTL, invalidation, cache hit/miss behavior, NGINX load balancing, load testing, hot keys, cache stampede, memory eviction, persistence, observability, and failure modes.

## References

- Redis documentation: https://redis.io/docs/latest/
- Redis command docs: https://redis.io/docs/latest/commands/
- Redis expiration docs: https://redis.io/docs/latest/commands/expire/
- Redis eviction docs: https://redis.io/docs/latest/develop/reference/eviction/
- NGINX load balancing docs: https://docs.nginx.com/nginx/admin-guide/load-balancer/http-load-balancer/
- NGINX upstream module docs: https://nginx.org/en/docs/http/ngx_http_upstream_module.html

