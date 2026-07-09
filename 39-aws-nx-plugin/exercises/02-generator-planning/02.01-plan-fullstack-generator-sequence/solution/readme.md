# Solution: Plan Full-Stack Generator Sequence

One valid sequence:

```bash
pnpm create @aws/nx-workspace product-app --iac=cdk
pnpm nx g @aws/nx-plugin:ts#website --name=web
pnpm nx g @aws/nx-plugin:ts#website#auth --project=@product-app/web --cognitoDomain=product-demo
pnpm nx g @aws/nx-plugin:ts#api --name=api --framework=trpc --auth=iam
pnpm nx g @aws/nx-plugin:ts#infra --name=infra
pnpm nx g @aws/nx-plugin:connection --sourceProject=@product-app/web --targetProject=@product-app/api
```

Use `--dry-run` on generator commands when exploring changes in an existing workspace. The connection command should run after both source and target projects exist.
