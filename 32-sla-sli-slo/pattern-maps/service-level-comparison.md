# Service Level Comparison

| Term | Audience | Purpose | Main Risk |
| --- | --- | --- | --- |
| SLI | engineering and operations | measure service behavior | measuring the wrong thing |
| SLO | engineering and product | define acceptable reliability target | unrealistic or non-actionable targets |
| SLA | customers and business | make external promise with consequences | overcommitting beyond operational reality |
| OLA | internal provider and consumer teams | define handoffs, response, escalation, and ownership | confusing internal support capacity with end-user reliability |
| KPI | engineering, operations, product, or leadership | track performance, efficiency, cost, or business outcomes | optimizing a proxy that does not improve user value |

## How They Relate

- An `SLI` is the measurement.
- An `SLO` is the internal reliability target for that measurement.
- An `SLA` is an external promise with consequences.
- An `OLA` is an internal agreement that helps teams deliver the service.
- A `KPI` tracks broader performance and outcome trends; it may support an SLO but is not the same thing.
