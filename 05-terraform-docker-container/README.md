# Lesson 05: Manage a Docker Container with Terraform

## Goal

Use Terraform to pull an Nginx image and run a local Docker container.

This lesson avoids cloud resources. It still teaches the Terraform workflow: `init`, `fmt`, `validate`, `plan`, `apply`, outputs, state, and `destroy`.

## Initialize

```bash
cd 05-terraform-docker-container
terraform init
```

## Review

```bash
terraform fmt
terraform validate
terraform plan
```

## Apply

```bash
terraform apply
```

Open:

```text
http://localhost:8083
```

## Inspect

```bash
terraform output
docker ps --filter name=docker-course-terraform-nginx
terraform state list
terraform state show docker_container.nginx
```

## Practice Tasks

1. Change `host_port` to `8084`.
2. Change `container_name`.
3. Add another output for the image name.
4. Run `terraform plan` before and after each change.
5. Destroy and recreate the container.

## Clean Up

```bash
terraform destroy
```

