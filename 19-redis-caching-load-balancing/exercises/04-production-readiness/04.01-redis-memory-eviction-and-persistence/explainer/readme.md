# Explainer: Redis Memory, Eviction, and Persistence

Redis is often used as a cache, but it still needs memory rules.

This lesson configures:

```text
maxmemory 128mb
maxmemory-policy allkeys-lru
appendonly yes
```

`allkeys-lru` means Redis can evict least recently used keys from all keys when memory is full.

Persistence options matter if Redis stores data that must survive restart. For cache-only Redis, persistence may be less important than fast recovery from origin.

