# Exercises: Manage a Docker Container with Terraform

## Sections

1. `01-plan-apply`
   - Change a variable and inspect the plan before applying.
2. `02-resource-lifecycle`
   - Observe how resource identity affects replacement.
3. `03-outputs`
   - Add useful outputs for operators and scripts.
4. `04-validation`
   - Add input validation for safer changes.
5. `05-state`
   - Destroy, recreate, and inspect local state.

## Suggested Flow

Read the plan before every apply. Treat state as the source of what Terraform currently manages.

```text
edit HCL -> fmt/validate -> plan -> apply -> inspect output/state
```

## Completion Target

By the end, you should be able to explain:

- How Terraform plans describe proposed changes.
- Why some arguments update resources and others replace them.
- How outputs expose useful resource data.
- Why local state is sensitive and should not be committed.
