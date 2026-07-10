# Exercises: Puppet Configuration Management

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-puppet-foundations/01.01-agent-master-vs-agentless`
   - Compare Puppet's agent model with agentless configuration tools.

2. `01-puppet-foundations/01.02-resources-catalogs-and-idempotence`
   - Understand how manifests become catalogs and converge node state.

3. `02-modeling-infrastructure/02.01-classes-profiles-and-roles`
   - Model infrastructure using modules, profiles, and roles.

4. `02-modeling-infrastructure/02.02-hiera-data-separation`
   - Move environment-specific values into Hiera.

5. `03-operations-and-compliance/03.01-code-manager-and-puppetfile`
   - Reason about environment promotion, Puppetfile-managed modules, and Code Manager deployment.

6. `03-operations-and-compliance/03.02-reporting-and-drift-control`
   - Design drift reporting and corrective workflows.

7. `04-migration-and-tradeoffs/04.01-compare-puppet-and-ansible`
   - Compare long-lived Puppet convergence with task-oriented Ansible use.

8. `04-migration-and-tradeoffs/04.02-adopt-puppet-enterprise-controls`
   - Decide when enterprise governance and reporting justify Puppet.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
```

Then inspect:

```text
modules/
manifests/
scenario-designs/
```
