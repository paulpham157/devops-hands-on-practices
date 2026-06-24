# Choose the Right Pipeline Pattern

1. Freshness under one hour is acceptable, backfill matters, and raw data can be remodelled later.
2. Fraud scoring needs low-latency updates, so batch would be too slow.
3. Ordering, state, replay, and debugging complexity.
4. When models change, quality rules improve, or historical reprocessing is required.

The best pipeline is the one whose latency and recovery model match the consumer need.

