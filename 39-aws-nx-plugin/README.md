# Lesson 39: AWS Nx Plugin

## Goal

Learn how `@aws/nx-plugin` uses Nx generators to scaffold cloud-native AWS applications, connect frontend and backend projects, and attach CDK or Terraform infrastructure.

This lesson teaches:

- where `@aws/nx-plugin` fits in an AWS application platform workflow.
- how Nx workspaces organize generated apps, APIs, agents, shared constructs, and infrastructure projects.
- how generators such as `ts#website`, `ts#api`, `ts#infra`, `terraform#project`, and `connection` compose a full-stack app.
- how local development differs from deploying generated cloud resources.
- why teams should review generated IaC, IAM permissions, environment configuration, and connections before deployment.
- how to decide when a scaffolded AWS workspace is helpful versus when a smaller hand-written repo is clearer.

No AWS account is required for the core exercises. This lesson is offline-first and focuses on generator planning, command review, and production workflow reasoning.

## Navigation

- Previous lesson: `38-openstack-private-cloud`
- Next lesson: `40-nx-workspace`

## Related Lessons

- `08-github-actions-gitlab-ci`
- `21-aws-azure-gcp-cloud-fundamentals`
- `22-serverless-functions-platforms`
- `23-iac-cdk-cloudformation-pulumi-terraform`
- `31-backend-for-frontend`
- `40-nx-workspace`

## Mental Model

```text
workspace -> generator commands -> connected projects -> local dev loop -> IaC review -> deploy with controlled credentials
```

The plugin is useful when a team wants repeatable AWS application scaffolding rather than hand-assembling every frontend, backend, auth, and infrastructure boundary.

## Lab Layout

```text
workspace-blueprints/  Generator maps and local workflow notes
scenario-designs/      Scenarios for choosing CDK, Terraform, and generated connections
scripts/               Validation helper
exercises/             Structured hands-on practice
```

## Core Generator Map

| Need | Example command | Purpose |
| --- | --- | --- |
| New workspace | `pnpm create @aws/nx-workspace my-project` | Create an Nx workspace configured for AWS app development |
| TypeScript website | `pnpm nx g @aws/nx-plugin:ts#website --name=demo-website` | Scaffold a React website project |
| Website auth | `pnpm nx g @aws/nx-plugin:ts#website#auth --project=@my-project/demo-website --cognitoDomain=my-demo` | Add Cognito-backed website auth wiring |
| TypeScript API | `pnpm nx g @aws/nx-plugin:ts#api --name=demo-api --framework=trpc --auth=iam` | Scaffold a type-safe API with AWS deployment shape |
| CDK infrastructure | `pnpm nx g @aws/nx-plugin:ts#infra --name=infra` | Add an AWS CDK infrastructure project |
| Terraform infrastructure | `pnpm nx g @aws/nx-plugin:terraform#project --name=infra` | Add a Terraform infrastructure project |
| Project connection | `pnpm nx g @aws/nx-plugin:connection --sourceProject=@my-project/demo-website --targetProject=@my-project/demo-api` | Wire generated projects together |

## Prerequisites For A Real Run

The upstream quick start expects recent local tooling. Treat these as real-run prerequisites, not required reading-only prerequisites:

- Git
- Node 22 or newer
- PNPM 11 or newer, or another supported package manager
- UV for Python generator paths
- AWS credentials only when deploying real cloud resources

## Safe Practice Rules

- Use `--dry-run` when exploring generators in an existing workspace.
- Review generated files before committing them.
- Keep AWS credentials outside the repo.
- Review IAM, Cognito, API Gateway, Lambda, and infrastructure outputs before deployment.
- Prefer local dev and generated diff review before any cloud deploy.

## Validate

From this lesson directory:

```bash
./scripts/validate.sh
```

This checks required lesson files, shell syntax, YAML syntax for scenarios, and exercise coverage. It does not create an Nx workspace or deploy AWS resources.

Optional local inspection commands:

```bash
sed -n '1,220p' workspace-blueprints/generator-map.md
sed -n '1,220p' workspace-blueprints/local-workflow.md
```

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover Nx workspace purpose, generator command planning, frontend/backend connection, local development, infrastructure review, and production adoption tradeoffs.

## References

- AWS Nx Plugin documentation: https://awslabs.github.io/nx-plugin-for-aws/en/
- AWS Nx Plugin quick start: https://awslabs.github.io/nx-plugin-for-aws/en/get_started/quick-start/
- Nx documentation: https://nx.dev/
- AWS CDK documentation: https://docs.aws.amazon.com/cdk/
- Terraform documentation: https://developer.hashicorp.com/terraform/docs
