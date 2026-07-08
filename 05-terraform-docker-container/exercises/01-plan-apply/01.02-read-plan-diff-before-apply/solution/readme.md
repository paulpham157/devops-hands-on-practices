# Read Plan Diff Before Apply

For a simple variable change, the plan shows exactly which argument changes and whether the provider can update in place or must replace the container.

That prediction should be written down before `terraform apply`, then verified with `terraform output`, `docker ps`, or `terraform state show`.
