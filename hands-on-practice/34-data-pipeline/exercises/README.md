# Exercises: Data Pipeline

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-pipeline-foundations/01.01-what-a-data-pipeline-is`
   - Understand the full pipeline lifecycle from source to publish.

2. `01-pipeline-foundations/01.02-etl-vs-elt`
   - Compare transformation before load and after load.

3. `02-pipeline-modes/02.01-batch-vs-streaming`
   - Choose the right latency and complexity tradeoff.

4. `02-pipeline-modes/02.02-ingestion-buffering-and-landing-zones`
   - Understand raw landing and replay-friendly ingestion design.

5. `03-orchestration-and-quality/03.01-orchestration-and-dependencies`
   - Read task dependencies and publish sequencing.

6. `03-orchestration-and-quality/03.02-data-quality-idempotency-and-reprocessing`
   - Apply validation and rerun-safe thinking.

7. `04-production-pipeline-operations/04.01-observability-lineage-and-failure-handling`
   - Operate pipelines with lineage and recovery visibility.

8. `04-production-pipeline-operations/04.02-choose-the-right-pipeline-pattern`
   - Choose pipeline mode and transformation pattern for realistic needs.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
```

Then inspect:

```text
pattern-maps/
ingestion/
batch-vs-streaming/
etl-elt/
orchestration/
quality-and-lineage/
scenario-designs/
```

No cloud account is required.

