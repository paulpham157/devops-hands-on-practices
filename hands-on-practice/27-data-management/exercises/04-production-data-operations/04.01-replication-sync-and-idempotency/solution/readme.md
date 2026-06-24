# Replication, Synchronization, and Idempotency

1. Stable event IDs help detect duplicates and track processing.
2. Because retries and duplicate delivery are normal in asynchronous systems.
3. There is no clear plan for duplicates, missed events, or stuck projections.
4. They recover systems after missed updates, bugs, or partial failure conditions.

