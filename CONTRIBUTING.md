# Contributing

Use this guide if you want to add, edit, validate, or review lesson content in this repository.

Learners should start with [README.md](README.md) and [LEARNING_PATHS.md](LEARNING_PATHS.md). This document is for contributors and maintainers.

## Contributor Workflow

1. Pick the lesson folder you want to edit.
2. Read that lesson's `README.md`, exercises, and local scripts before changing content.
3. Keep the lesson self-contained inside its numbered folder.
4. Update examples, exercises, and validation scripts together when the lesson behavior changes.
5. Run the relevant validation checks before committing.

## Lesson-Level Validation

Many lessons provide a local validation script:

```bash
cd <lesson-folder>
./scripts/validate.sh
```

Use lesson-level validation when you are editing one topic and want the fastest feedback loop.

These scripts are intended for contributor verification. They typically check local syntax, required files, rendered artifacts, or tool availability for that lesson.

## Repository-Wide Validation

Run the full validation sweep from the repository root when you make broad changes or want a wider confidence check:

```bash
./scripts/validate-all.sh
```

Before submitting broader changes, also run:

```bash
find . -path '*/scripts/*.sh' -exec sh -n {} \;
git diff --check
```

## Authoring Rules

- Keep lesson instructions direct, runnable, and local-first.
- Put tool prerequisites and any installation or setup steps in that lesson's `README.md`; do not add tool-specific installation instructions to the root `README.md`.
- Use ASCII unless a file already uses another character set.
- Prefer offline validation, reading tasks, or design exercises when a topic depends on paid cloud services.
- When a lesson includes `exercises/`, keep `explainer`, `problem`, and `solution` aligned.
- If you change the lesson goal, also update any examples, exercise wording, and validation logic that depend on it.
- Use `docker compose` instead of legacy `docker-compose`.
- Use Grafana Alloy for new Loki collection examples; keep Promtail only as legacy context.
- Treat CDKTF as deprecated context, not a recommended new IaC path.
- Refer to Google Cloud Functions 2nd gen as Cloud Run functions where relevant.
- Pin CI runner images or document the update policy for production examples.

## Reviewing Lesson Changes

When reviewing a lesson update, check:

- whether the lesson goal is still clear
- whether commands and examples still match the files in the lesson
- whether exercises still teach the intended concept
- whether validation scripts still reflect the current expected outcome
- whether cleanup steps are still correct

## AI Support

This repository includes two local skills under `.agents/skills/`:

- `dohp-how-to-learn` helps with learner-facing guidance, lesson selection, and debugging lesson steps.
- `dohp-review-my-practice` helps review a learner attempt against the lesson goal.

These skills are learner-focused. For contributor work, use them only when that learner-facing perspective is useful. Do not treat them as a replacement for updating lesson files and validation logic directly.
