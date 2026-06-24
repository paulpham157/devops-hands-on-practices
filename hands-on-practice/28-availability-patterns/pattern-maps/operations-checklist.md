# Operations Checklist

Use this checklist before implementing availability patterns.

## Health

- Are liveness and readiness separated?
- Which dependency failures should stop traffic to an instance?
- Can health checks fail fast without becoming expensive?

## Load

- Which workloads can be queued?
- What queue depth or age indicates danger?
- Which requests need priority under stress?

## Protection

- What are the throttling dimensions: rate, concurrency, tenant, or dependency stress?
- Do clients receive clear retry guidance?
- Are retries bounded and jittered?

## Degradation

- What is the minimum useful response during dependency failure?
- Which features can return stale or partial data?
- Is there a runbook for switching into or out of degraded mode?

