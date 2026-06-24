# Explainer: Run Init, Plan, and Apply

`tofu init` prepares the working directory. It downloads providers and initializes module sources.

`tofu plan` creates an execution plan. It shows what OpenTofu would create, update, or destroy, but does not make the change.

`tofu apply` executes a plan. It creates or updates real resources and writes state.

For local practice, it is useful to save a plan:

```bash
tofu plan -out=tfplan
tofu apply tfplan
```

That ensures the apply uses the same plan you reviewed.
