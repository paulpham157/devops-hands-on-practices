# Lesson 10: Manage Docker with OpenTofu Modules

## Goal

Use OpenTofu to run a local Nginx container through a reusable module.

This lesson avoids cloud resources. It still teaches the infrastructure-as-code workflow used in real teams:

- `tofu init`
- `tofu fmt`
- `tofu validate`
- `tofu plan`
- `tofu apply`
- `tofu output`
- `tofu state`
- `tofu test`
- `tofu destroy`

## Navigation

- Previous lesson: `09-k3s-local-cluster`
- Next lesson: `11-devsecops-container-pipeline`

## Related Lessons

- `05-terraform-docker-container`
- `21-aws-azure-gcp-cloud-fundamentals`
- `23-iac-cdk-cloudformation-pulumi-terraform`

## What Is OpenTofu

OpenTofu is an open source infrastructure-as-code tool that uses HCL configuration, providers, modules, state, plans, and apply/destroy workflows.

For DevOps Hands-on Practices, treat OpenTofu as a practical way to describe desired infrastructure and let the tool calculate the changes needed to reach that desired state.

## OpenTofu vs Terraform in This Course

Lesson 05 uses Terraform directly against Docker resources.

This lesson repeats the same local idea with OpenTofu, then adds structure that is closer to real infrastructure repositories:

- A root module that owns provider configuration and environment inputs
- A child module under `modules/nginx_site`
- Input validation
- Outputs for human and script usage
- Native OpenTofu tests under `tests/`
- Scripts that make the workflow repeatable

OpenTofu is designed to be broadly compatible with Terraform configuration, but the migration step should still be tested on a copy of code and state before changing production workflows.

## Prerequisites and Entry Check

Install:

- Docker Desktop or Docker Engine
- OpenTofu

Check:

```bash
docker version
tofu version
```

On macOS with Homebrew:

```bash
brew install opentofu
```

Entry check: explain what a module input, output, state file, and `tofu plan` represent before applying changes.

## Run the Fast Checks

```bash
cd 10-opentofu-docker-module
./scripts/format-validate.sh
./scripts/test.sh
```

The test file uses `command = plan`, so it validates the module without creating a Docker container.

## Plan

```bash
./scripts/plan.sh
```

The script saves a local execution plan as `tfplan`.

OpenTofu plan shows what would change. It does not make changes by itself.

## Apply

```bash
./scripts/apply.sh tfplan
```

Open:

```text
http://localhost:8095
```

## Inspect

```bash
tofu output
tofu state list
tofu state show 'module.nginx_site.docker_container.nginx'
docker ps --filter name=docker-course-dev-nginx
```

Expected resources:

```text
module.nginx_site.docker_image.nginx
module.nginx_site.docker_container.nginx
```

## Change Inputs

Use CLI variables to test a change without editing files:

```bash
tofu plan -var='host_port=8096' -var='environment=test'
```

Use a `.tfvars` file for repeated local experiments:

```hcl
environment = "test"
host_port   = 8096
```

Do not commit personal `.tfvars` files if they contain local or sensitive values.

## State Note

This lab uses local state in `terraform.tfstate`, which is the default state filename for OpenTofu.

Local state is fine for one-person local practice. Real shared infrastructure should use a remote state backend or a TACOS platform that provides locking, access control, version history, and safer collaboration.

## Clean Up

```bash
./scripts/destroy.sh
```

Check that the container is gone:

```bash
docker ps --filter name=docker-course-dev-nginx
```

## Exercises

Use the exercise track after the first successful validation:

```text
exercises/README.md
```

The exercises cover OpenTofu basics, plan/apply workflow, modules, state, outputs, testing, safe input changes, and Terraform-to-OpenTofu migration thinking.

## References

- OpenTofu installation: https://opentofu.org/docs/intro/install/
- OpenTofu init: https://opentofu.org/docs/cli/commands/init/
- OpenTofu plan: https://opentofu.org/docs/cli/commands/plan/
- OpenTofu apply: https://opentofu.org/docs/cli/commands/apply/
- OpenTofu state: https://opentofu.org/docs/language/state/
- OpenTofu variables: https://opentofu.org/docs/language/values/variables/
- OpenTofu outputs: https://opentofu.org/docs/language/values/outputs/
- OpenTofu test: https://opentofu.org/docs/cli/commands/test/
- OpenTofu migration guide: https://opentofu.org/docs/intro/migration/
- Docker provider in OpenTofu Registry: https://search.opentofu.org/provider/kreuzwerker/docker/v3.9.0
