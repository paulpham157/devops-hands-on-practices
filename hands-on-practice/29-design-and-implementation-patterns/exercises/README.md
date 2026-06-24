# Exercises: Design and Implementation Patterns

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-pattern-foundations/01.01-when-to-use-design-patterns`
   - Understand when these patterns solve a real boundary problem.

2. `01-pattern-foundations/01.02-separate-core-domain-from-infrastructure`
   - Keep domain logic distinct from integration and runtime helpers.

3. `02-modernization-patterns/02.01-strangler-fig-migration`
   - Read an incremental legacy migration route map.

4. `02-modernization-patterns/02.02-anti-corruption-layer-integration`
   - Translate external models without polluting the core domain.

5. `03-runtime-extension-patterns/03.01-sidecar-for-cross-cutting-concerns`
   - Read sidecar responsibilities and runtime composition.

6. `03-runtime-extension-patterns/03.02-sidecar-vs-embedded-logic`
   - Decide when helper logic belongs beside the app or inside it.

7. `04-production-architecture/04.01-observability-boundaries-and-ownership`
   - Apply ownership and failure-mode thinking to helper boundaries.

8. `04-production-architecture/04.02-choose-the-right-design-pattern`
   - Choose the right pattern for migration, runtime extension, or integration.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
```

Then inspect:

```text
pattern-maps/
strangler-fig/
sidecar/
anti-corruption-layer/
scenario-designs/
```

No cloud account is required.

