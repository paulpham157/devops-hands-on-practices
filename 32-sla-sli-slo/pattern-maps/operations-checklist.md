# Operations Checklist

Use this checklist before publishing service level targets.

## SLI Design

- Does the SLI reflect a user journey?
- Is the good-event definition explicit?
- Are thresholds clear and measurable?

## SLO Design

- Is the window defined?
- Is the target ambitious but realistic?
- Is the error budget understood by engineering and product?

## Alerting

- Are alerts based on budget burn or meaningful risk, not only static thresholds?
- Can the team act on the alert?
- Are fast-burn and slow-burn conditions distinguished?

## SLA Governance

- Are exclusions documented?
- Are measurement methods stable?
- Are remedies clearly defined?

## OLA Governance

- Is the internal provider and consumer team named?
- Are response, escalation, handoff, and support-hour expectations explicit?
- Does the OLA support a service SLO without pretending to guarantee the user outcome by itself?
- Is there a fallback when the provider team cannot meet the handoff expectation?

## KPI Governance

- Does each KPI have an owner, review cadence, and decision it informs?
- Is the KPI separated from the SLI/SLO so teams do not optimize a proxy blindly?
- Are delivery, reliability, cost, and workload KPIs reviewed together?
- Can the team explain what action follows when the KPI worsens?
