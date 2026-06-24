# Database per Service and API Composition

In microservices, each service often owns its own database.

This improves autonomy and reduces direct database coupling, but it makes cross-service reads harder.

A common answer is API composition:

```text
client or aggregator -> service A + service B + service C -> combined response
```

This works well for some reads, but it adds latency and partial failure handling.

