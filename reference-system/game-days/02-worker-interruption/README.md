# Game Day 02: Worker Interruption and Safe Requeue

This production-owner exercise follows the reference queue-migration module. Complete Game Day 01 and read `migration/README.md` first.

## Scenario

An order worker is interrupted after an order has moved from `order_queue` to `processing_orders`. The order may have had side effects before the worker stopped. A teammate suggests immediately requeueing everything.

Your task is to decide whether replay is safe, not merely to make the queue look empty.

## Setup

```sh
cd reference-system
./scripts/up.sh
./scripts/check.sh
```

Start an [incident record](../01-redis-dependency-outage/evidence/incident-template.md). You may reuse its timeline structure but must write a new impact and follow-up section.

## Inject the Fault

```sh
./scripts/inject-worker-interruption.sh
```

The script stops only the local worker and submits one test order through the gateway. Do not read it before an attempt if you want the scenario to remain blind.

## Tasks

1. Show where the order is located and which component is unavailable.
2. State what evidence would prove that replay is safe or unsafe in a real system.
3. Choose and justify one action: requeue, quarantine, or manual reconciliation.
4. Recover the local worker and verify the user journey.
5. Write a migration/rollback follow-up using `migration/migration-decision-template.md`.

## Recovery

```sh
./scripts/recover-worker.sh
./scripts/check.sh
./scripts/cleanup.sh
```

Use `migration/scripts/requeue-processing.sh` only after documenting the replay decision. It is a local helper, not an automatic production recovery policy.

## Evidence Required

- queue inspection output;
- explicit replay/idempotency reasoning;
- recovery verification;
- migration or rollback decision;
- prioritized follow-up for retry, poison-message, and alerting behavior.

Use [rubric.md](rubric.md) after your attempt.
