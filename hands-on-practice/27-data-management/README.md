# Lesson 27: Data Management

## Goal

Learn practical data management patterns for distributed cloud systems.

This lesson teaches:

- why distributed data management is hard
- consistency tradeoffs across services
- database-per-service and API composition
- partitioning large datasets
- separating read and write workloads with CQRS
- event sourcing and projections
- saga and compensating transaction patterns
- replication, synchronization, idempotency, and operational data integrity

No cloud account is required for the core exercises.

## Mental Model

```text
write request -> source of truth -> propagation or replication -> read model -> consumer
```

In distributed systems, data concerns are often about coordination cost:

- which service owns which data
- how quickly other services must see changes
- whether reads and writes have different scaling needs
- how failures are recovered when updates cross service boundaries

## Core Problems

| Problem | Typical Question |
| --- | --- |
| Consistency | How fresh must reads be after a write? |
| Partitioning | How do we scale data volume and throughput? |
| Read and write separation | Can query workloads be separated from command workloads? |
| Cross-service coordination | How do services stay synchronized without one shared database? |
| Failure recovery | What happens after a partial success across services? |

## Lab Layout

```text
pattern-maps/         Comparison tables and operational checklists
consistency-models/   Read and write consistency notes
partitioning/         Dataset partitioning examples
cqrs-event-sourcing/  CQRS and event sourcing examples
saga-sync/            Saga and synchronization examples
scenario-designs/     Team and system design scenarios
scripts/              Validation helper
exercises/            Structured hands-on practice
```

## Core Patterns

| Pattern | What It Solves | Main Tradeoff |
| --- | --- | --- |
| Database per service | service ownership and loose coupling | harder cross-service queries and transactions |
| API composition | combine read data from multiple services | higher latency and partial failure handling |
| CQRS | separate write model from read model | more moving parts and synchronization delay |
| Event sourcing | durable history of state changes | more complex debugging and replay design |
| Saga | coordinate distributed changes without 2PC | compensation logic is hard and failure-prone |
| Partitioning | scale large datasets and throughput | hot partitions and rebalancing complexity |

## Consistency Notes

Data consistency is not binary. The platform must choose where strict coordination is necessary and where eventual synchronization is acceptable.

Typical distinctions:

- strong consistency for critical invariants
- eventual consistency for asynchronous propagation
- monotonic or session-style expectations for user experience

Do not promise immediate global correctness if the architecture is asynchronous.

## Partitioning Notes

Partitioning divides data across partitions or shards to improve scale.

Common strategies:

- hash partitioning
- range partitioning
- tenant partitioning
- time-based partitioning

Good partition keys distribute load well. Bad partition keys create hot spots.

## CQRS and Event Sourcing Notes

CQRS separates command handling from query handling.

This is useful when:

- reads and writes scale differently
- query models differ from write models
- the team needs read-optimized projections

Event sourcing stores domain changes as ordered events rather than only current state. It is powerful, but it adds operational and design complexity. Use it when history, replay, and auditability are real requirements, not as a default.

## Saga and Synchronization Notes

Distributed systems often avoid a single transaction across multiple service databases.

Instead they use:

- asynchronous events
- local transactions per service
- saga steps
- compensating actions on failure

This model reduces tight coupling, but it requires explicit recovery design.

## Production Questions

Before choosing a data pattern, answer:

1. Which service is the source of truth for each data domain?
2. Which invariants require immediate consistency?
3. Which reads can tolerate stale data?
4. Which workloads need independent read scaling?
5. How will partial failures be detected and repaired?

## Validate

From this lesson directory:

```bash
./scripts/validate.sh
```

This checks:

- required lesson files
- shell script syntax
- YAML syntax
- JSON syntax

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover consistency, database-per-service, partitioning, CQRS, event sourcing, saga compensation, synchronization, idempotency, and pattern selection.

## References

- Azure Architecture Center CQRS pattern: https://learn.microsoft.com/azure/architecture/patterns/cqrs
- Azure Architecture Center data partitioning guidance: https://learn.microsoft.com/azure/architecture/best-practices/data-partitioning-strategies
- Azure Architecture Center event sourcing pattern: https://learn.microsoft.com/azure/architecture/patterns/event-sourcing
- Azure Architecture Center compensating transaction pattern: https://learn.microsoft.com/azure/architecture/patterns/compensating-transaction
- AWS Prescriptive Guidance saga orchestration pattern: https://docs.aws.amazon.com/prescriptive-guidance/latest/cloud-design-patterns/saga-orchestration.html
- Google Cloud Architecture distributed systems: https://cloud.google.com/architecture
- Martin Fowler CQRS: https://martinfowler.com/bliki/CQRS.html

