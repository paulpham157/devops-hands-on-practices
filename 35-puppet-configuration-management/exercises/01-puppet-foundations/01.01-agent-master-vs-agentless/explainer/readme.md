# Agent-Based vs Agentless

Use this exercise to separate steady-state configuration management from ad hoc execution.

Focus points:

- Puppet Server compiles catalogs for nodes that run `puppet agent`.
- Bolt runs tasks and plans over SSH or WinRM without requiring the agent first.
- Agent-based convergence is stronger for long-lived fleets; agentless execution is useful for rollout, remediation, and discovery.
