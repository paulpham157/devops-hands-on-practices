# Exercises: Nx Workspace

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-workspace-foundations/01.01-map-workspace-projects-and-tasks`
   - Identify projects, targets, and task boundaries.

2. `01-workspace-foundations/01.02-project-graph-vs-task-graph`
   - Separate code dependency graphs from execution graphs.

3. `02-tasks-and-caching/02.01-understand-inferred-tasks`
   - Explain how plugins infer tasks from tool config.

4. `02-tasks-and-caching/02.02-design-cache-inputs`
   - Decide which inputs must invalidate cached task output.

5. `03-affected-and-ci/03.01-plan-affected-ci`
   - Plan `nx affected` usage with explicit base and head commits.

6. `03-affected-and-ci/03.02-review-ci-cache-risk`
   - Identify when caching and affected-only execution can be unsafe.

7. `04-plugin-ecosystem/04.01-choose-plugins-for-a-team`
   - Choose Nx plugins for realistic workspace scenarios.

8. `04-plugin-ecosystem/04.02-decide-when-to-write-a-custom-plugin`
   - Decide when custom plugin maintenance is justified.

Extra reading after the core exercises:

- `workspace-maps/nx-json-and-boundaries.md`
- `workspace-maps/ci-workflow.md`
- `plugin-catalog/plugin-selection.md`

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
```

Then read:

```text
workspace-maps/
plugin-catalog/
scenario-designs/
```

No generated Nx workspace is required for the exercises.
