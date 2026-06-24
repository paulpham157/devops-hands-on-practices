# Explainer: Run Local Tracing

Jaeger is a local trace backend and UI.

In this lesson:

```text
app -> OTel Collector -> Jaeger
```

Jaeger helps you inspect:

- trace duration
- span hierarchy
- error spans
- span attributes
- events
- service names

The sample app returns a `trace_id` in responses so you can connect an API response to a trace in Jaeger.

