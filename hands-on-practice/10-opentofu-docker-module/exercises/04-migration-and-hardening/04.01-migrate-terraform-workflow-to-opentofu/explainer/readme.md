# Explainer: Migrate Carefully from Terraform to OpenTofu

OpenTofu is designed to be compatible with Terraform configuration, but migration should still be treated as an infrastructure change.

A cautious migration flow is:

```text
back up code and state -> install OpenTofu -> run tofu init -> run tofu validate -> run tofu plan -> test a small change -> review with the team
```

Do not start by editing production state.

For a shared team, also review:

- Provider source addresses and versions
- Lock files
- Backend configuration
- CI commands
- Policy checks
- Access control around state
- Rollback plan

This lesson uses local state only because it is a single-user Docker lab.
