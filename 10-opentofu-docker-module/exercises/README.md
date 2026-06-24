# Exercises: OpenTofu Docker Module

## Sections

1. `01-opentofu-basics`
   - Understand what OpenTofu manages.
   - Run `init`, `plan`, and `apply` safely.

2. `02-modules-and-state`
   - Read the root module and child module boundary.
   - Inspect outputs and local state.

3. `03-testing-and-validation`
   - Run format, validation, and native OpenTofu tests.
   - Change variables safely and review the plan.

4. `04-migration-and-hardening`
   - Compare the Terraform lesson with this OpenTofu lesson.
   - Plan a cautious migration workflow.

## Completion Target

By the end, you should be able to explain:

- What OpenTofu does before, during, and after `apply`.
- Why providers, variables, outputs, modules, and state are separate concepts.
- How to use `tofu test` for plan-time checks.
- Why shared infrastructure needs remote state, locking, and code review.
- How to approach a Terraform-to-OpenTofu migration without editing production state blindly.
