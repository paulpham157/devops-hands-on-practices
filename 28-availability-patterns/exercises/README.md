# Exercises: Availability Patterns

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-availability-foundations/01.01-availability-and-failure-modes`
   - Understand availability goals and failure behavior.

2. `01-availability-foundations/01.02-health-endpoint-monitoring`
   - Separate liveness, readiness, and deeper dependency health.

3. `02-resilience-under-load/02.01-queue-based-load-leveling`
   - Reason about asynchronous buffering under spikes.

4. `02-resilience-under-load/02.02-throttling-and-backpressure`
   - Apply admission control and overload protection.

5. `03-failure-containment/03.01-partial-failure-and-graceful-degradation`
   - Preserve useful system behavior during dependency failure.

6. `03-failure-containment/03.02-retries-timeouts-and-overload-risks`
   - Understand how recovery behavior can worsen outages.

7. `04-production-operations/04.01-monitoring-alerting-and-runbooks`
   - Use metrics and runbooks to operate availability patterns safely.

8. `04-production-operations/04.02-choose-the-right-availability-pattern`
   - Choose the right availability pattern for realistic system stress.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
```

Then inspect:

```text
pattern-maps/
health-monitoring/
queue-load-leveling/
throttling/
scenario-designs/
```

No cloud account is required.

