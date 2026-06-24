# Operations Checklist

Use this checklist before shipping a pipeline.

## Data Flow

- Is the source data raw, staged, or trusted at each step?
- Is freshness target explicit?
- Do consumers know the data latency expectation?

## Quality

- What validations must pass before publish?
- What happens to bad records?
- Are null, duplicate, and schema drift cases handled?

## Recovery

- Can the pipeline rerun safely?
- Are outputs idempotent or append-only by design?
- Is backfill or replay supported?

## Observability

- Are row counts, freshness, failures, and lag measured?
- Can operators see lineage from source to published dataset?
- Is there a clear alert and rerun path?

