# Exercises: AWS Nx Plugin

Work through these exercises after reading the lesson README.

This exercise set assumes the learner can recognize basic Nx terms. For the
full explanation of projects, targets, graphs, caching, and plugin categories,
use `40-nx-workspace`.

## Exercise Map

1. `01-plugin-foundations/01.01-map-the-plugin-contract`
   - Identify what `@aws/nx-plugin` adds on top of an existing Nx workspace model.

2. `01-plugin-foundations/01.02-choose-workspace-iac`
   - Choose CDK or Terraform for a workspace scenario.

3. `02-generator-planning/02.01-plan-fullstack-generator-sequence`
   - Build a generator sequence for a website, API, auth, and infrastructure.

4. `02-generator-planning/02.02-connect-frontend-and-backend`
   - Explain what the connection generator should wire together.

5. `03-local-development/03.01-separate-local-dev-from-cloud-deploy`
   - Separate local proof from cloud deployment proof.

6. `03-local-development/03.02-review-generated-infrastructure`
   - Review generated CDK or Terraform before deployment.

7. `04-production-adoption/04.01-design-a-ci-review-loop`
   - Design a CI review loop for generated changes.

8. `04-production-adoption/04.02-decide-when-to-use-the-plugin`
   - Choose when scaffolding is useful and when manual structure is clearer.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
```

Then read:

```text
workspace-blueprints/generator-map.md
workspace-blueprints/local-workflow.md
scenario-designs/
```

No AWS account or real Nx workspace is required for the exercises.
