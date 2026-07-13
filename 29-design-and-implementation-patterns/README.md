# Lesson 29: Design and Implementation Patterns

## Goal

Learn design and implementation patterns that keep cloud applications maintainable, adaptable, and easier to evolve.

This lesson teaches:

- how design patterns reduce coupling and isolate change
- Strangler Fig for incremental legacy migration
- Sidecar for runtime extension of service capabilities
- Anti-Corruption Layer for integrating external or legacy systems without polluting the core domain
- practical tradeoffs around ownership, migration speed, and operational complexity

No cloud account is required for the core exercises.

## Navigation

- Previous lesson: `28-availability-patterns`
- Next lesson: `30-network-patterns`

## Related Lessons

- `27-data-management`
- `30-network-patterns`
- `31-backend-for-frontend`

## Prerequisites and Entry Check

- Completion of `27-data-management` and `28-availability-patterns`, or equivalent distributed-design experience.
- No cloud account is required for the core pattern maps and scenarios.

Entry check: name one change boundary, one ownership boundary, and one rollback concern for a legacy integration.

## Mental Model

```text
change pressure -> architectural boundary -> translation or extension pattern -> safer evolution
```

These patterns are useful when the system must change without rewriting everything at once.

## Core Problems

| Problem | Typical Question |
| --- | --- |
| Legacy migration | How do we replace old paths gradually without one big cutover? |
| External integration | How do we talk to awkward external models without corrupting our own domain? |
| Cross-cutting runtime behavior | How do we add logging, proxying, auth, or sync behavior without modifying app code everywhere? |
| Maintainability | How do we keep infrastructure and integration concerns from leaking into business logic? |

## Lab Layout

```text
pattern-maps/             Comparison tables and operational checklists
strangler-fig/            Incremental migration routing examples
sidecar/                  Sidecar deployment and responsibility examples
anti-corruption-layer/    Translation contracts and adapter examples
scenario-designs/         Migration and integration scenarios
scripts/                  Validation helper
exercises/                Structured hands-on practice
```

## Core Patterns

| Pattern | What It Solves | Main Tradeoff |
| --- | --- | --- |
| Strangler Fig | incremental replacement of a legacy system | dual-routing and coexistence complexity |
| Sidecar | add cross-cutting behavior beside an app | extra runtime components and ownership boundaries |
| Anti-Corruption Layer | protect core domain from external model pollution | more translation code and integration complexity |

## Strangler Fig

Strangler Fig helps replace a legacy system gradually by routing only selected functionality to a new service while the old system still handles the rest.

Typical shape:

```text
client -> routing layer -> new capability or legacy capability
```

This is useful when:

- full rewrite is too risky
- migration must happen capability by capability
- traffic needs controlled cutover

## Sidecar

The Sidecar pattern attaches a helper component to the main workload to provide shared runtime behavior such as:

- proxying
- telemetry collection
- configuration sync
- secret retrieval
- protocol translation

This keeps some concerns out of the application binary, but it also creates a multi-component runtime that must be operated together.

## Anti-Corruption Layer

An Anti-Corruption Layer sits between your core domain and an external or legacy system.

Its job is to translate:

- language
- models
- protocols
- assumptions

Without it, the external model often leaks into internal code and makes the domain harder to maintain.

## Pattern Boundaries

Good use of these patterns creates explicit ownership:

- who owns migration routing
- who owns translation logic
- who owns sidecar lifecycle and configuration

Bad use creates hidden coupling and unclear failure modes.

## Production Questions

Before choosing one of these patterns, answer:

1. What exact change pressure are we isolating?
2. Which boundary must remain stable for application teams?
3. Who owns the new routing, adapter, or sidecar lifecycle?
4. Is the pattern temporary migration scaffolding or a long-term platform boundary?
5. What failure mode appears if the helper component or translation layer breaks?

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

The exercises cover pattern selection, domain boundaries, Strangler Fig migration, ACL translation, Sidecar responsibilities, ownership, and production tradeoffs.

## Cleanup

The core exercises use design artifacts and example manifests. Remove only generated reports or disposable local resources created during the exercise.

## References

- Azure Architecture Center Strangler Fig pattern: https://learn.microsoft.com/azure/architecture/patterns/strangler-fig
- Azure Architecture Center Sidecar pattern: https://learn.microsoft.com/azure/architecture/patterns/sidecar
- Azure Architecture Center Anti-Corruption Layer pattern: https://learn.microsoft.com/azure/architecture/patterns/anti-corruption-layer
- Martin Fowler Anti-Corruption Layer: https://martinfowler.com/bliki/AntiCorruptionLayer.html
