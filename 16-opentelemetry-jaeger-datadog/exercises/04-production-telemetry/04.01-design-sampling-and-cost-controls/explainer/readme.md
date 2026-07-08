# Design Sampling and Cost Controls

Telemetry has operational cost.

OpenTelemetry can produce rich traces, but production systems usually need sampling, batching, memory limits, and retention policies. Sampling should preserve useful debugging traces while keeping backend volume predictable.

Collector-side sampling is often easier to govern than every service making independent sampling decisions.
