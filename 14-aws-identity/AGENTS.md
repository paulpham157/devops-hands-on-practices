# Repository Guidelines

## Scope

These instructions apply to `14-aws-identity/` (Lesson 14: AWS Identity Types and Access Control). Follow the root `AGENTS.md` as the general policy, then use this file for lesson-specific work.

## Lesson Structure

- Keep the lesson self-contained; do not place lesson assets in another numbered folder.
- Update `README.md` when commands, prerequisites, ports, cleanup steps, or learning goals change.
- Put guided practice under `exercises/` and preserve the `explainer/`, `problem/`, `solution/` pattern when it already exists.
- Keep runnable helpers under `scripts/`; keep sample source, manifests, policies, charts, notes, and scenario files in clearly named subfolders.

## Commands

Run commands from this lesson directory unless a README says otherwise.

```bash
cd 14-aws-identity
```

This lesson may be documentation- or design-heavy. Prefer lightweight checks such as Markdown review, JSON/YAML parsing, and command examples that can run locally.

## Style & Editing Rules

- Keep Markdown concise, instructional, and command-focused.
- Use fenced code blocks with language hints such as `bash`, `yaml`, `json`, or `text`.
- Prefer POSIX shell for scripts with `#!/usr/bin/env sh` and `set -eu`.
- Do not add real credentials, tokens, kubeconfigs, Terraform state, scanner reports, or generated artifacts.

## Validation Before Commit

Run the most relevant checks for files you changed:

```bash
git diff --check
find 14-aws-identity -path '*/scripts/*.sh' -exec sh -n {} \;
```

If a check requires Docker, Kubernetes, a cloud account, or a large image pull and you skip it, mention that in the final note or PR.