# Destroy, Recreate, and Inspect State

Expected flow:

```text
state list shows managed resources
destroy removes the Docker resources
state list becomes empty or no longer shows those resources
apply recreates the resources
state show prints current recorded attributes
```

Do not commit `terraform.tfstate`. It can contain sensitive or environment-specific data.
