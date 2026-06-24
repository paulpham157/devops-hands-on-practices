# Synchronization Notes

When services keep their own databases, synchronization often relies on events and idempotent consumers.

Key practices:

- use stable event IDs
- make handlers idempotent
- record processing offsets or receipts
- expect duplicates and retries
- design repair jobs for missed or stuck updates

This is why synchronization is a product of both code and operations. The pattern is not complete without repair strategy.

