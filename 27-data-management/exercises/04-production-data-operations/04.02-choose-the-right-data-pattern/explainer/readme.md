# Choose the Right Data Pattern

Data patterns should follow workload shape and business invariants.

Strong signals for CQRS:

- read-heavy workload
- query model different from write model
- stale reads acceptable within a small window

Strong signals for saga:

- workflow spans several service-owned databases
- one global transaction is not practical

Strong signals for event sourcing:

- audit history and replay are real product requirements

