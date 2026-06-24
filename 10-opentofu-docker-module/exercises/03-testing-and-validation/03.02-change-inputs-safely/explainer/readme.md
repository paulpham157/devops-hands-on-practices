# Explainer: Change Inputs Safely

Variables let you change behavior without rewriting resource blocks.

Try changes through CLI variables first:

```bash
tofu plan -var='environment=test' -var='host_port=8096'
```

If the change is repeated often, use a local `.tfvars` file:

```hcl
environment = "test"
host_port   = 8096
```

Review every plan before applying. A changed variable may replace a resource, update it in place, or fail validation.
