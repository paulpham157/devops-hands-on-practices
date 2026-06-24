# Solution: Compare Terraform and OpenTofu Lessons

Similar files:

```text
versions.tf
main.tf
variables.tf
outputs.tf
README.md
```

Extra structure in the OpenTofu lesson:

```text
modules/nginx_site
tests/plan.tftest.hcl
scripts/
exercises/
```

Command mapping:

```text
terraform init      -> tofu init
terraform fmt       -> tofu fmt
terraform validate  -> tofu validate
terraform plan      -> tofu plan
terraform apply     -> tofu apply
terraform output    -> tofu output
terraform state     -> tofu state
terraform destroy   -> tofu destroy
```

Before using OpenTofu with production state, back up the code and state, verify provider compatibility, run init/validate/plan in a safe environment, review backend locking and access control, and test a small change before larger rollout.
