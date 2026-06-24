# Solution: Versioning, Security, and Observability

REST APIs can be versioned with paths such as:

```text
/v1/products
```

Protobuf schemas should evolve by adding fields, keeping field numbers stable, and avoiding removal or reuse of existing field numbers.

Internal APIs should use TLS or mTLS, authentication, authorization, input validation, rate limits, and request size limits.

Retries need idempotency because the same operation may be attempted more than once.

Cross-boundary observability should include:

- request ID
- trace ID
- service name
- operation name
- latency
- status or error code

