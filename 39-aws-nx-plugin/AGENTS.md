# Repository Guidelines

## Scope

These instructions apply to `39-aws-nx-plugin/` (Lesson 39: AWS Nx Plugin). Follow the root `AGENTS.md` as the general policy, then use this file for lesson-specific work.

## Lesson Structure

- Keep the lesson self-contained; do not place lesson assets in another numbered folder.
- Update `README.md` when commands, prerequisites, ports, cleanup steps, or learning goals change.
- Put guided practice under `exercises/` and preserve the `explainer/`, `problem/`, `solution/` pattern when it already exists.
- Keep runnable helpers under `scripts/`; keep sample commands, workflow maps, and scenario files in clearly named subfolders.

## Commands

Run commands from this lesson directory unless a README says otherwise.

```bash
cd 39-aws-nx-plugin
./scripts/validate.sh
```

## Style & Editing Rules

- Keep Markdown concise, instructional, and command-focused.
- Use fenced code blocks with language hints such as `bash`, `yaml`, `json`, or `text`.
- Prefer POSIX shell for scripts with `#!/usr/bin/env sh` and `set -eu`.
- Do not add generated Nx workspaces, real AWS credentials, `.env` files, deployment outputs, Terraform state, CDK output directories, or cloud-generated artifacts.

## Validation Before Commit

Run the most relevant checks for files you changed:

```bash
git diff --check
find 39-aws-nx-plugin -path '*/scripts/*.sh' -exec sh -n {} \;
cd 39-aws-nx-plugin && ./scripts/validate.sh
```

If a check requires Node, PNPM, AWS credentials, or cloud deployment and you skip it, mention that in the final note or PR.
