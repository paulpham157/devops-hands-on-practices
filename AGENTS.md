# Repository Guidelines

## Project Structure & Module Organization

This repository is a numbered DevOps hands-on curriculum. Each top-level lesson folder follows the pattern `NN-topic-name`, for example `00-docker-fundamentals`, `07-jenkins-ci-pipeline`, and `34-data-pipeline`.

Common lesson structure:

- `README.md`: lesson goal, concepts, commands, and cleanup.
- `exercises/`: structured practice; many lessons use `explainer/`, `problem/`, and `solution/`.
- `scripts/`: repeatable helpers such as `validate.sh`, `smoke-test.sh`, or build scripts.
- Domain assets: examples include `compose.yaml`, `manifests/`, `charts/`, `policies/`, `notes/`, `sample-app/`, and `scenario-designs/`.

Keep new lessons self-contained inside their numbered folder. Put reusable examples under a clear subfolder such as `examples/`, `sample-app/`, `notes/`, or `scripts/`.

## Build, Test, and Development Commands

There is no single global build command. Run commands from the relevant lesson directory.

Useful examples:

```bash
cd 00-docker-fundamentals && ./scripts/validate.sh
cd 01-docker-compose-flask-redis && docker compose up --build
cd 15-helm-kustomize-artifact-repositories && ./scripts/validate.sh
find . -path '*/scripts/*.sh' -exec sh -n {} \;
git diff --check
```

Use `docker compose down` or lesson-specific cleanup scripts before leaving running containers.

## Coding Style & Naming Conventions

Use Markdown for lesson content and keep instructions direct, runnable, and local-first. Prefer ASCII text unless a file already uses another character set.

Naming conventions:

- Lesson folders: `NN-kebab-case-topic`.
- Exercise folders: `section/task-number-short-name`, for example `01-basics/01.01-read-a-config`.
- Scripts: POSIX shell where practical, with `#!/usr/bin/env sh` and `set -eu`.
- YAML/JSON examples: keep indentation consistent with the surrounding file.

## Testing Guidelines

Every lesson with scripts should provide a lightweight validation path. Prefer checks that work offline: file existence, shell syntax, manifest rendering, JSON/YAML parsing, and local smoke tests.

Before submitting broad changes, run:

```bash
git diff --check
find . -path '*/scripts/*.sh' -exec sh -n {} \;
```

For lesson-specific changes, also run that lesson's `./scripts/validate.sh` when present.

## Commit & Pull Request Guidelines

Existing commits use short imperative summaries, for example `Add observability and CI platform labs`. Follow that style:

```text
Add Docker fundamentals exercise structure
Update GitOps validation scripts
```

Pull requests should describe changed lessons, list validation commands run, and call out any tools not executed because they require cloud accounts, clusters, or large Docker pulls.

## Security & Configuration Tips

Do not commit local credentials, `.env` files, kubeconfigs, Terraform state, generated scanner reports, or real secret values. Use `.example` files for templates and keep generated artifacts under ignored folders such as `reports/`, `artifacts/`, or `sandbox/`.
