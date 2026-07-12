# RPO/RTO Decision Record: Reference Order Flow

## Scope and Assumptions

- Protected data:
- Backup mechanism and cadence:
- Consistency boundary:
- Dependencies not covered:

## Objectives

| Objective | Proposed value | Reasoning | How the drill verifies it |
| --- | --- | --- | --- |
| RPO | | | |
| RTO | | | |

## Restore Plan

1. Preconditions and authorization:
2. Restore steps:
3. Verification signals:
4. Rollback or stop condition:

## Known Limitations

- The local reference worker needs manual requeue after an interrupted processing-list entry and has no idempotency guarantee.
- The drill uses one local Docker volume, not a regional/facility failure.
- Backup files are unencrypted local artifacts and must never contain real data.
