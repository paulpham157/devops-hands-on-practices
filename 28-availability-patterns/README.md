# Lesson 28: Availability Patterns

## Goal

Learn practical availability patterns that keep systems operational under failure, overload, and partial outages.

This lesson teaches:

- what availability really means in distributed systems
- health endpoint monitoring
- queue-based load leveling
- throttling and backpressure
- graceful degradation under partial failure
- interaction between retries, timeouts, overload, and recovery
- monitoring, alerting, and operational runbooks for availability

No cloud account is required for the core exercises.

## Navigation

- Previous lesson: `27-data-management`
- Next lesson: `29-design-and-implementation-patterns`

## Related Lessons

- `19-redis-caching-load-balancing`
- `30-network-patterns`
- `32-sla-sli-slo`

## Mental Model

```text
incoming demand -> admission control -> buffered or direct processing -> dependency health -> degraded or normal response
```

Availability is not only about "service responds" versus "service is down." It also includes:

- whether the system can keep serving useful responses
- whether overload spreads to dependencies
- whether failures are detected quickly
- whether recovery is safe and observable

## Core Problems

| Problem | Typical Question |
| --- | --- |
| Health detection | How do we know a service is alive, ready, and healthy enough to receive traffic? |
| Spike handling | What happens when demand exceeds immediate processing capacity? |
| Overload control | How do we reject or defer work before the system collapses? |
| Partial failure | What still works when one dependency is slow or unavailable? |
| Recovery safety | How do we avoid retries and failovers making the outage worse? |

## Lab Layout

```text
pattern-maps/         Comparison tables and operational checklists
health-monitoring/    Health endpoint examples and status contracts
queue-load-leveling/  Queue buffering and async processing examples
throttling/           Admission control and rate-limiting examples
scenario-designs/     Failure and platform response scenarios
scripts/              Validation helper
exercises/            Structured hands-on practice
```

## Core Patterns

| Pattern | What It Solves | Main Tradeoff |
| --- | --- | --- |
| Health endpoint monitoring | detect liveness, readiness, and dependency state | false confidence if checks are shallow or slow |
| Queue-based load leveling | absorb spikes and smooth background work | added latency and queue operational complexity |
| Throttling | protect system capacity under overload | some requests are delayed or rejected |
| Graceful degradation | preserve useful functionality during partial failure | reduced feature set or stale data |

## Health Endpoint Monitoring

Health endpoints usually answer different questions:

- liveness: should the process be restarted?
- readiness: should the instance receive traffic?
- deeper health: are critical dependencies working well enough?

Do not mix these carelessly. A broken optional dependency should not always force a restart.

## Queue-Based Load Leveling

Queues help when demand spikes faster than a service or dependency can process work.

Typical flow:

```text
request accepted -> work queued -> worker consumes later -> result stored or emitted
```

This improves resilience under spikes, but it changes the user experience:

- work may become asynchronous
- latency shifts from request time to completion time
- queue depth becomes an operational signal

## Throttling and Backpressure

Throttling limits how much work the system admits.

This can be based on:

- request rate
- concurrency
- tenant quota
- downstream dependency stress

Without backpressure, retries and bursts often turn a slow service into a dead one.

## Graceful Degradation

Availability patterns often work best together:

- health checks keep traffic away from bad instances
- queues absorb bursty work
- throttling protects critical capacity
- degradation preserves core user journeys

A degraded system can still be available if it continues serving a reduced but useful function.

## Production Questions

Before choosing an availability pattern, answer:

1. What is the minimum useful behavior during dependency failure?
2. Which workloads can be delayed asynchronously?
3. Which requests must be rejected early under overload?
4. Which dependency failures should remove an instance from traffic?
5. Which metrics prove the system is surviving, not just answering?

## Validate

From this lesson directory:

```bash
./scripts/validate.sh
```

This checks:

- required lesson files
- shell script syntax
- YAML syntax
- JSON syntax

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover availability goals, health checks, queue load leveling, throttling, graceful degradation, overload risks, alerting, and pattern selection.

## References

- Azure Architecture Center health endpoint monitoring pattern: https://learn.microsoft.com/azure/architecture/patterns/health-endpoint-monitoring
- Azure Architecture Center queue-based load leveling pattern: https://learn.microsoft.com/azure/architecture/patterns/queue-based-load-leveling
- Azure Architecture Center throttling pattern: https://learn.microsoft.com/azure/architecture/patterns/throttling
- Google Cloud Architecture reliability: https://cloud.google.com/architecture/framework/reliability
- AWS Well-Architected reliability pillar: https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/welcome.html

