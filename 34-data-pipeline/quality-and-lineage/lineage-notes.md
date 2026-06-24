# Lineage and Idempotency Notes

Useful pipeline operations depend on traceability.

Teams should know:

- where data came from
- which job version transformed it
- which batch or offsets were consumed
- whether a rerun would duplicate output

Idempotent publish steps and clear lineage make backfills safer.

