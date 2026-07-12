# Queue Delivery Migration Exercise

The reference worker uses a processing-list acknowledgement pattern:

```text
order_queue -> processing_orders -> processed_order_ids
```

The worker moves an order to `processing_orders`, performs its local processing, records a result, then acknowledges by removing the processing entry. If the worker stops after the move but before acknowledgement, the order remains visible in `processing_orders` for investigation or requeue.

This is more recoverable than the earlier at-most-once `BLPOP` pattern, but it is not a complete production queue implementation. It still needs idempotency, retry limits, poison-message handling, observability, access control, and a migration plan for real workloads.

## Practice

1. Start the reference system and submit an order.
2. Inspect the three Redis lists while the worker is active.
3. Stop the worker during a test order, inspect `processing_orders`, then use the requeue helper.
4. Write a migration/rollback decision using [migration-decision-template.md](migration-decision-template.md).

```sh
./scripts/requeue-processing.sh
```

The requeue helper is local-only. It does not decide whether replaying an order is safe; that decision depends on idempotency and the business operation.
