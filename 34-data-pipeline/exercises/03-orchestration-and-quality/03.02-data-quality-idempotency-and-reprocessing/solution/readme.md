# Data Quality, Idempotency, and Reprocessing

1. Examples: `row_count_not_zero`, `primary_key_unique`, `required_columns_not_null`, or `event_timestamp_within_expected_window`.
2. Bad batches are quarantined, publish is blocked, and the pipeline owner is alerted.
3. Lineage shows which source, version, and batch produced the output being repaired.
4. Reruns should not duplicate published results accidentally.

