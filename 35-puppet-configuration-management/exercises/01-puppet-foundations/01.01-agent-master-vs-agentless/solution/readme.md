# Agent-Based vs Agentless

| Need | Best First Tooling |
| --- | --- |
| Continuous baseline enforcement on long-lived nodes | Puppet Server plus agents |
| One-off package check before agent rollout | Bolt task over SSH |
| Coordinated remediation across 20 hosts tonight | Bolt plan, then move the steady state into Puppet code |

Answers:

1. Bolt is excellent for orchestration and transition work, but it does not replace recurring catalog enforcement.
2. The team ends up with script drift, weaker auditability, and no continuous correction loop.
