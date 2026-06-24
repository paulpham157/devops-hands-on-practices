# Production Serverless Notes

## Cold Starts

Cold start is startup latency when the platform needs to initialize a new function instance.

Factors:

- runtime
- package size
- dependency loading
- VPC/network setup
- memory allocation
- initialization code

Mitigations:

- keep dependencies small.
- move heavy setup outside hot path only when it can be reused.
- choose lighter runtimes where appropriate.
- use provisioned or reserved concurrency features when available.
- use edge runtimes for lightweight edge logic.

## Cost

Serverless cost usually combines:

- invocations
- duration
- memory/CPU allocation
- data transfer
- logs
- downstream services

Serverless can be cheap at low or bursty traffic, but expensive if workloads run constantly or log too much.

## State

Functions should usually be stateless.

Use external state stores:

- object storage
- managed database
- cache
- queue
- durable workflow service

Do not assume local disk or memory survives between invocations.

## Retries and Idempotency

Many event integrations retry failures.

Handlers should be idempotent:

```text
same event processed more than once -> safe result
```

Use idempotency keys, deduplication tables, or event IDs for side effects.

## Security

Minimum controls:

- least privilege per function.
- managed secrets.
- private networking only when needed.
- input validation.
- dependency scanning.
- request authentication.
- audit logs.

