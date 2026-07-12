# Required Capstone Artifacts

Submit links or paths to each artifact. Reuse the reference-system and existing lesson work where appropriate, but explain any adaptation.

1. **Architecture and ADRs:** current/proposed diagram, boundaries, key alternatives, and rejected options.
2. **Threat model and identity:** assets, actors, trust boundaries, authentication/authorization approach, secret lifecycle, and residual risks.
3. **Infrastructure and delivery design:** environments, state/configuration model, build/promotion path, policy gates, and rollback boundary.
4. **Observability and SLOs:** user journeys, SLIs/SLOs, alert rationale, dashboard or query design, and measurement limitations.
5. **Capacity and cost model:** traffic assumptions, bottleneck hypotheses, scaling plan, cost drivers, budget guardrails, and validation experiment.
6. **Data protection and DR:** backup scope, restore test, RPO/RTO, dependency failure behavior, and regional/facility assumptions.
7. **Migration and rollback:** queue/delivery migration steps, compatibility plan, rollback point, and data-loss handling.
8. **Runbooks and incident plan:** detection, escalation, communication, mitigation, recovery, and ownership.
9. **Game-day evidence:** completed Redis-outage record or an equivalent approved scenario, including postmortem and follow-up priorities.
10. **Improvement roadmap:** sequenced actions constrained by team capacity, expected risk/toil reduction, and review dates.

An artifact may be incomplete if it labels its uncertainty, gives a validation plan, and explains its decision boundary. Unsupported certainty is weaker than a scoped assumption.
