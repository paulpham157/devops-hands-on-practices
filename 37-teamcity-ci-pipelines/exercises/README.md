# Exercises: TeamCity CI Pipelines

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-teamcity-foundations/01.01-server-agents-and-build-configurations`
   - Understand TeamCity's control plane and worker model.

2. `01-teamcity-foundations/01.02-vcs-triggers-and-build-steps`
   - Map repository events to build execution.

3. `02-pipeline-design/02.01-kotlin-dsl-and-templates`
   - Use Kotlin DSL and templates for reusable pipeline configuration.

4. `02-pipeline-design/02.02-build-chains-and-artifact-dependencies`
   - Design multi-stage pipelines with explicit dependencies.

5. `03-governance-and-security/03.01-secrets-parameters-and-approvals`
   - Model safe parameter handling and manual gates.

6. `03-governance-and-security/03.02-branch-policies-and-merge-gates`
   - Design branch-aware status reporting and merge controls.

7. `04-operations-and-migration/04.01-observability-and-agent-capacity`
   - Plan for queues, agent pools, and pipeline visibility.

8. `04-operations-and-migration/04.02-compare-teamcity-jenkins-and-github-actions`
   - Compare TeamCity to other CI platforms already in the course.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
```

Then inspect:

```text
build-configs/
ci-cd/
scenario-designs/
```
