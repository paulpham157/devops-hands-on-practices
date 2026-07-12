# Review Rubric: Worker Interruption

| Criterion | Insufficient | Meets production-owner preparation | Strong evidence |
| --- | --- | --- | --- |
| Queue investigation | Assumes an order disappeared. | Identifies `order_queue`, `processing_orders`, and worker state. | Explains timing and uncertainty with command/log evidence. |
| Replay decision | Requeues automatically. | States idempotency/reconciliation condition before replay. | Compares replay, quarantine, and manual options against customer impact. |
| Recovery | Starts worker without verification. | Verifies user journey and queue state after recovery. | Records a rollback boundary and remaining risk. |
| Follow-up | Generic “add retries” suggestion. | Defines retry, poison-message, or alerting improvement. | Prioritizes an observable migration plan with owner and validation. |
