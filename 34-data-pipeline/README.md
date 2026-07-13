# Lesson 34: Data Pipeline

## Goal

Learn how modern data pipelines move, transform, validate, and publish data reliably.

This lesson teaches:

- what a data pipeline is
- ingestion, landing zones, and downstream serving layers
- ETL versus ELT
- batch versus streaming pipeline modes
- orchestration, dependencies, and scheduling
- data quality, idempotency, reprocessing, and lineage
- operational concerns such as failure handling, latency, and observability

No cloud account is required for the core exercises.

## Navigation

- Previous lesson: `33-snyk-and-sonar`
- Next lesson: `35-puppet-configuration-management`

## Related Lessons

- `23-iac-cdk-cloudformation-pulumi-terraform`
- `27-data-management`
- `28-availability-patterns`

## Prerequisites and Entry Check

- Completion of `27-data-management` and `28-availability-patterns`, or equivalent data/reliability experience.
- No cloud account is required for the core pipeline models and scenario files.

Entry check: define one source of truth, one quality rule, one idempotency key, and one replay boundary for a data flow.

## Mental Model

```text
source -> ingest -> stage or land -> transform -> validate -> publish -> consume
```

A useful data pipeline does more than move bytes. It also decides:

- when data is ready
- how data is transformed
- how bad data is detected
- how failed runs are retried or replayed
- how consumers trust the result

## Core Problems

| Problem | Typical Question |
| --- | --- |
| Ingestion | How does data enter the platform reliably? |
| Mode choice | Should data move in batches or streams? |
| Transformation | Should data be transformed before loading or after landing? |
| Coordination | How are task order and dependencies managed? |
| Trust | How do we know published data is complete and valid? |
| Recovery | What happens when a run partially fails? |

## Lab Layout

```text
pattern-maps/         Comparison tables and operational checklists
ingestion/            Ingestion and landing-zone examples
batch-vs-streaming/   Mode comparison and latency tradeoffs
etl-elt/              Transformation model examples
orchestration/        Workflow dependency examples
quality-and-lineage/  Validation, idempotency, and lineage notes
scenario-designs/     Pipeline design scenarios
scripts/              Validation helper
exercises/            Structured hands-on practice
```

## Pipeline Building Blocks

| Layer | Responsibility |
| --- | --- |
| Source | operational database, API, logs, files, events |
| Ingestion | capture and land raw or semi-raw data |
| Transformation | clean, join, enrich, aggregate, and model data |
| Validation | reject, quarantine, or flag broken data |
| Publish | expose trusted tables, topics, or files for consumers |
| Consumption | BI, ML, analytics, product features, or downstream services |

## ETL vs ELT

`ETL` means extract, transform, then load.

`ELT` means extract, load, then transform in the target platform.

ETL is often useful when:

- transformation must happen before the destination can store the data safely
- data contracts are strict at ingest time

ELT is often useful when:

- the target warehouse or lakehouse can handle heavy transformation
- raw landing data should be preserved for later modeling

## Batch vs Streaming

Batch pipelines process data in scheduled chunks.

Streaming pipelines process events continuously or near-continuously.

Choose batch when:

- latency tolerance is minutes or hours
- cost simplicity matters
- upstream sources naturally arrive in chunks

Choose streaming when:

- consumers need near-real-time updates
- event order and continuous processing matter
- operational complexity is justified by latency requirements

## Orchestration and Quality

Pipelines need more than SQL or code transforms. They also need:

- dependency order
- retries
- backfills
- quality checks
- idempotent reruns
- lineage and auditability

Without these, the pipeline is fragile even if the transformation logic is correct.

Current pipeline stacks commonly separate orchestration, transformation, quality, and lineage. Airflow 3.x is a major-generation orchestration baseline, dbt Fusion is the newer dbt execution engine path, GX Core is a common open source quality framework, and OpenLineage is a common standard for lineage events.

## Production Questions

Before designing a pipeline, answer:

1. How fresh must the data be?
2. Which datasets are raw, staged, or trusted?
3. What quality checks must pass before publish?
4. Can jobs be rerun safely?
5. Who consumes the output and how much lateness can they tolerate?

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

The exercises cover ETL versus ELT, batch versus streaming, ingestion and landing zones, orchestration, quality checks, idempotency, lineage, and pipeline pattern selection.

## Cleanup

The core exercises use example data and design files. Remove generated local reports or test data only after recording the evidence needed for the exercise; do not delete a shared dataset.

## References

- Google Cloud architecture center: https://cloud.google.com/architecture
- AWS analytics architecture guidance: https://aws.amazon.com/big-data/datalakes-and-analytics/
- Azure architecture data guide: https://learn.microsoft.com/azure/architecture/data-guide/
- Apache Airflow documentation: https://airflow.apache.org/docs/
- dbt documentation: https://docs.getdbt.com/
- dbt Fusion engine: https://docs.getdbt.com/docs/fusion
- OpenLineage documentation: https://openlineage.io/docs/
- GX Core: https://greatexpectations.io/
