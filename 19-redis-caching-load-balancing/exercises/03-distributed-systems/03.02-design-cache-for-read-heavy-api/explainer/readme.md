# Explainer: Design Cache for Read-Heavy API

A read-heavy API benefits from caching when many requests ask for the same expensive data.

Design decisions:

- cache key format
- TTL
- invalidation trigger
- fallback behavior
- memory limit
- eviction policy
- observability metrics
- security and data sensitivity

Do not cache blindly. Cache where it reduces real origin work and where stale data is acceptable.

