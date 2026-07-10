# AWS Nx Plugin Generator Map

`@aws/nx-plugin` is a scaffolding layer for AWS-focused Nx workspaces. The important learning task is not memorizing every generator. The important task is understanding what boundary each generator creates and which generated projects must be reviewed together.

## Workspace Creation

```bash
pnpm create @aws/nx-workspace my-project
```

Common decision during workspace creation:

- CDK as the infrastructure provider
- Terraform as the infrastructure provider

The selected provider changes the generated infrastructure project and deployment workflow.

## Full-Stack TypeScript Shape

```bash
pnpm nx g @aws/nx-plugin:ts#website --name=demo-website
pnpm nx g @aws/nx-plugin:ts#website#auth --project=@my-project/demo-website --cognitoDomain=my-demo
pnpm nx g @aws/nx-plugin:ts#api --name=demo-api --framework=trpc --auth=iam
pnpm nx g @aws/nx-plugin:ts#infra --name=infra
pnpm nx g @aws/nx-plugin:connection --sourceProject=@my-project/demo-website --targetProject=@my-project/demo-api
```

Review these boundaries:

- frontend project
- API project
- authentication wiring
- generated AWS constructs or Terraform modules
- connection metadata between frontend and backend

## Python API Or Agent Shape

```bash
pnpm nx g @aws/nx-plugin:py#project
pnpm nx g @aws/nx-plugin:py#api
pnpm nx g @aws/nx-plugin:py#agent
```

Python paths make `uv` relevant for local dependency management. Review runtime packaging, environment variables, generated handlers, and deploy target before assuming parity with TypeScript examples.

## Terraform Infrastructure Shape

```bash
pnpm nx g @aws/nx-plugin:terraform#project --name=infra
```

Review generated Terraform for:

- provider configuration
- backend and state expectations
- module boundaries
- variables and outputs
- IAM-sensitive resources

## Connection Generator

```bash
pnpm nx g @aws/nx-plugin:connection --sourceProject=@my-project/demo-website --targetProject=@my-project/demo-api
```

The connection step is a boundary contract. It should make the calling project know how to reach the target project without copying endpoint values by hand.
