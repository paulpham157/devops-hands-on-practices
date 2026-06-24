# Solution: Redis Memory, Eviction, and Persistence

Memory limit:

```text
128mb
```

Eviction policy:

```text
allkeys-lru
```

`appendonly yes` enables the append-only file persistence mode.

`allkeys-lru` is reasonable when Redis is used as cache and any key can be evicted safely.

`noeviction` can be safer when Redis contains data that must not be silently evicted, but writes will fail when memory is full.

