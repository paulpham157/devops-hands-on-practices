# Solution: Run Local Tracing

Expected service:

```text
course-otel-app
```

The longest trace should usually be a request to:

```text
/checkout?slow=true
```

The error trace should come from:

```text
/checkout?fail=true
```

Expected checkout child spans:

- `inventory.lookup`
- `payment.authorize`

The exact trace ID changes every request. Use the `trace_id` returned in the JSON response to find a specific trace.

