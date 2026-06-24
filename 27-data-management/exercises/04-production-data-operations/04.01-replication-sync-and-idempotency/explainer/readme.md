# Replication, Synchronization, and Idempotency

Asynchronous data propagation is only safe when consumers tolerate duplicates, retries, and partial failures.

This is why idempotency matters:

- the same event may be delivered more than once
- recovery jobs may replay data
- downstream services may process retries after timeouts

Synchronization design is incomplete without duplicate-handling strategy.

