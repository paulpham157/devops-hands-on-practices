# Agent-Based vs Agentless

A platform team manages 400 Ubuntu VMs. 320 are long-lived and should auto-correct drift every 30 minutes. 80 are still being onboarded and only allow SSH right now.

Fill in the first-fit approach for each need.

| Need | Best First Tooling |
| --- | --- |
| Continuous baseline enforcement on long-lived nodes | TODO |
| One-off package check before agent rollout | TODO |
| Coordinated remediation across 20 hosts tonight | TODO |

Then answer:

1. Why should the team avoid treating Bolt as a full replacement for catalog-based convergence?
2. What operational risk appears if every task stays agentless forever?
