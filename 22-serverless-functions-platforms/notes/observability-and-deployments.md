# Observability and Deployments

## Observability

Track:

- invocation count
- error count
- duration
- cold starts if available
- throttles or rate limits
- retries
- dead-letter queue count
- downstream latency
- cost

Log with structure:

```json
{
  "request_id": "example",
  "function": "checkout-handler",
  "event_type": "http",
  "status": "ok"
}
```

Propagate trace context when calling other services.

## Deployments

Common deployment methods:

- provider CLI
- infrastructure as code
- framework deploy
- Git integration
- CI/CD pipeline

Production deployment checklist:

- separate dev/staging/prod.
- pin runtime versions.
- review IAM changes.
- test event payloads.
- use canary or gradual rollout when supported.
- define rollback procedure.
- keep environment variables and secrets separate.

