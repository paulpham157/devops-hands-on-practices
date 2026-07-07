# Terraform Docker Exercises

These exercises extend lesson 05. Initialize Terraform first:

```bash
cd 05-terraform-docker-container
terraform init
terraform validate
```

## Exercise Order

1. Change `host_port` to `8084` and inspect the plan before applying.
2. Change `container_name` and explain why Terraform replaces or updates the resource.
3. Add an output for the Docker image name.
4. Add variable validation for the host port range.
5. Destroy and recreate the container, then inspect the state file entries.

## Completion Rule

Finish each exercise only after checking the plan and state:

```text
edit HCL -> terraform fmt/validate -> terraform plan -> apply or explain why not
```
