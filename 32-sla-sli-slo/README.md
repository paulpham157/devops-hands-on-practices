# Lesson 32: SLA, SLI, SLO

## Goal

Learn how to define and use service level indicators, objectives, and agreements in a practical SRE workflow.

This lesson teaches:

- what `SLI`, `SLO`, and `SLA` each mean
- how `OLA` and `KPI` complement service-level thinking
- how to choose user-meaningful indicators
- how to set objectives over time windows
- how to calculate and use error budgets
- how burn-rate thinking supports alerting and operational response
- how internal SLOs differ from customer-facing SLAs
- how internal team commitments differ from reliability targets and performance measures

No cloud account is required for the core exercises.

## Navigation

- Previous lesson: `31-backend-for-frontend`
- Next lesson: `33-snyk-and-sonar`

## Related Lessons

- `06-observability-prometheus-grafana-loki`
- `16-opentelemetry-jaeger-datadog`
- `28-availability-patterns`

## Prerequisites and Entry Check

- Completion of `06-observability-prometheus-grafana-loki`, `16-opentelemetry-jaeger-datadog`, and `28-availability-patterns`, or equivalent telemetry/reliability experience.
- No cloud account is required for the core SLI/SLO policy exercises.

Entry check: name one user journey, its good event, target window, and the operational decision an exhausted error budget should trigger.

## Mental Model

```text
user journey -> measurable good event ratio or latency -> target over time -> operating response and contractual consequence
```

The important distinction is:

- `SLI`: what is measured
- `SLO`: target for that measurement over a time window
- `SLA`: external promise with consequences if the promise is missed
- `OLA`: internal agreement that defines supporting team responsibilities
- `KPI`: broader performance or outcome measure used for decisions

## Core Problems

| Problem | Typical Question |
| --- | --- |
| Measurement | What user-relevant signal should we measure? |
| Objective setting | How good is good enough over a realistic window? |
| Tradeoff control | How much unreliability can the team spend before feature velocity should slow down? |
| Contracts | Which promises belong in an external agreement and which stay internal? |

## Lab Layout

```text
pattern-maps/      Comparison tables and operational checklists
sli-models/        SLI examples and good-event definitions
slo-policies/      SLO targets, error budgets, and burn policy
sla-contracts/     Example contractual language and exclusions
scenario-designs/  Reliability scenarios and team tradeoffs
scripts/           Validation helper
exercises/         Structured hands-on practice
```

## Definitions

| Term | Meaning | Example |
| --- | --- | --- |
| SLI | measured reliability indicator | 99.95 percent of checkout requests succeed under 1 second |
| SLO | target for an SLI over a time window | checkout availability SLO is 99.9 percent over 30 days |
| SLA | customer-facing commitment with consequences | refund or credit if monthly availability drops below 99.5 percent |
| OLA | internal agreement between teams that supports service delivery | Platform acknowledges a P1 alert within 5 minutes and provides an escalation path |
| KPI | broader performance indicator for a team, process, or business outcome | change failure rate, deployment frequency, or cost per accepted order |

## What Makes a Good SLI

A useful SLI is:

- tied to a user journey
- easy to compute consistently
- resistant to vanity measurement
- actionable when it moves

Bad SLIs are often only low-level infrastructure metrics with weak user meaning.

## SLO and Error Budget

An SLO defines acceptable unreliability.

Example:

```text
99.9 percent success over 30 days -> 0.1 percent error budget
```

Error budget is useful because it turns reliability into an operating decision:

- if budget is healthy, feature velocity can continue
- if budget is burning too fast, reliability work takes priority

## SLA Notes

SLA is not just a stricter SLO.

An SLA is external and usually includes:

- measurement definition
- reporting window
- exclusions
- remedies or credits

Many internal systems should have SLOs without promising the same numbers in a customer-facing SLA.

## OLA and KPI Notes

An OLA is an internal operating agreement. It describes who must do what for another team or service to meet its goals. An OLA may cover response time, escalation, handoff, support hours, or dependency ownership. It is not a customer contract and it does not replace an SLO.

A KPI is a decision or performance measure. It may describe delivery speed, operational workload, cost, or business value. A KPI is not automatically a reliability target: `deployment frequency` can be a KPI, while `99.9 percent successful checkout requests over 30 days` is an SLO.

Example relationship:

```text
SLI: successful checkout request ratio
SLO: 99.9 percent over 30 days
SLA: customer credit below 99.5 percent
OLA: Platform pages the on-call team within 5 minutes for a P1 dependency alert
KPI: change failure rate and cost per accepted order
```

## Production Questions

Before defining service levels, answer:

1. Which user journeys matter most?
2. What counts as a good event?
3. Which latency or success thresholds map to real user value?
4. What error budget behavior should trigger engineering action?
5. Which commitments are safe enough to expose in contracts?
6. Which internal handoff needs an OLA, and which KPI would show whether the operating model is improving?

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

The exercises cover core definitions, good-event thinking, SLI design, error budgets, burn-rate policy, internal versus external commitments, OLA handoffs, KPI selection, and choosing practical objectives.

## Cleanup

The core lesson uses policy files and example data only. Remove generated reports or local dashboards created during the exercise; do not change a real customer SLA as a cleanup action.

## References

- Google SRE workbook on SLOs: https://sre.google/workbook/implementing-slos/
- Google Cloud service level objectives: https://cloud.google.com/stackdriver/docs/solutions/slo-monitoring
- Google SRE book: https://sre.google/sre-book/service-level-objectives/
- Datadog SLO guide: https://www.datadoghq.com/knowledge-center/slo/
