# Operations Checklist

Use this checklist before adopting distributed data patterns.

## Ownership

- Is every important dataset owned by one service?
- Are duplicate copies clearly labeled as read models, caches, or projections?

## Consistency

- Which writes require immediate confirmation?
- Which readers can tolerate stale data?
- Is eventual consistency visible in product behavior and support runbooks?

## Scale

- What is the partition key?
- How will hot partitions be detected?
- Can reads and writes scale independently?

## Recovery

- Are consumers idempotent?
- How are retries, duplicates, and out-of-order events handled?
- What is the repair path after a partially failed workflow?

