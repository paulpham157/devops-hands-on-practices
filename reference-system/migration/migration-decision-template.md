# Queue Migration and Rollback Decision Record

## Current and Target Behavior

- Current delivery semantics:
- Target delivery semantics:
- Idempotency key / duplicate handling:
- Poison-message and retry policy:

## Migration Plan

| Step | Compatibility risk | Validation | Rollback point |
| --- | --- | --- | --- |
| | | | |

## Requeue Decision

- Who may requeue a processing item?
- What evidence proves replay is safe?
- What customer impact occurs if it is not replayed?
- How will duplicate processing be detected?

## Observability and Follow-Up

- Queue-depth/age signals:
- Alert threshold and owner:
- Post-migration review date:
