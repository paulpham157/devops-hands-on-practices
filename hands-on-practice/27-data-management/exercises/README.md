# Exercises: Data Management

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-data-management-foundations/01.01-consistency-and-tradeoffs`
   - Understand consistency expectations and tradeoffs.

2. `01-data-management-foundations/01.02-database-per-service-and-api-composition`
   - Separate service ownership from cross-service read needs.

3. `02-scaling-and-access-patterns/02.01-partitioning-large-datasets`
   - Design partition keys and identify partitioning risks.

4. `02-scaling-and-access-patterns/02.02-read-write-separation-with-cqrs`
   - Understand when CQRS helps and what it costs.

5. `03-distributed-consistency/03.01-event-sourcing-and-projections`
   - Read event streams and reason about projection building.

6. `03-distributed-consistency/03.02-saga-and-compensation`
   - Read a distributed workflow and compensation model.

7. `04-production-data-operations/04.01-replication-sync-and-idempotency`
   - Apply synchronization and duplicate-handling thinking.

8. `04-production-data-operations/04.02-choose-the-right-data-pattern`
   - Choose the right data management pattern for realistic system constraints.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
```

Then inspect:

```text
pattern-maps/
consistency-models/
partitioning/
cqrs-event-sourcing/
saga-sync/
scenario-designs/
```

No cloud account is required.

