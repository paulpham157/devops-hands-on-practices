# DevOps Hands-on Practices

This repository is a versioned DevOps learning product made of lessons, exercises, and validation paths. The glossary here captures the course-specific terms used to describe how the curriculum is packaged and presented to learners.

## Contributor Context

Use this file when adding, editing, validating, reviewing, or releasing lesson content. Learners should use `README.md`, `LEARNING_PATHS.md`, and the selected lesson README instead.

### Contributor Workflow

1. Read the target lesson README, exercises, and local scripts before changing content.
2. Keep lesson content, examples, exercises, and validation logic self-contained and aligned.
3. Put tool prerequisites, installation steps, setup, commands, and cleanup in the lesson README.
4. Prefer local-first and offline-first exercises when cloud accounts or paid services are optional.
5. Keep `explainer`, `problem`, and `solution` materials aligned when a lesson uses that structure.

### Contributor Validation

Run the checks that match the scope of the change:

```bash
cd <lesson-folder>
./scripts/validate.sh
```

For broad changes, also run:

```bash
./scripts/validate-all.sh
find . -path '*/scripts/*.sh' -exec sh -n {} \;
git diff --check
```

Do not commit credentials, `.env` files, kubeconfigs, Terraform state, generated scanner reports, or real secret values. Use example files and placeholders.

### Authoring Conventions

- Use direct, runnable Markdown and prefer ASCII text.
- Use `docker compose` instead of legacy `docker-compose`.
- Use Grafana Alloy for new Loki collection examples; keep Promtail only as legacy context.
- Treat CDKTF as deprecated context, not a recommended new IaC path.
- Refer to Google Cloud Functions 2nd gen as Cloud Run functions where relevant.
- Pin CI runner images or document the update policy for production examples.

## Language

**Learning Product Version**:
A named curriculum version that represents a stable state of the course for learners to consume. It refers to the course as a learning product, not to an installable software package.
_Avoid_: Release package, npm package, raw snapshot

**Significant Curriculum Milestone**:
A course change substantial enough to justify a new learning product version. It includes adding meaningful new lesson coverage, changing learning paths or curriculum structure, or making broad content fixes that should move learners to the newer version.
_Avoid_: Routine merge, minor doc fix, typo-only change

**Manual Release Trigger**:
A deliberate maintainer action that starts creation of a new learning product version after a significant curriculum milestone is judged ready. It is not tied to every merge on the default branch.
_Avoid_: Auto-release on merge, continuous release

**Curated Release Notes**:
Release notes written manually for learners in curriculum language. They summarize meaningful course changes instead of exposing raw commit history or maintainer-oriented change labels.
_Avoid_: Raw commit log, auto-generated maintainer notes

**Editorial Release Workflow**:
A maintainer-driven release process that publishes a learning product version only when a significant curriculum milestone is ready. It favors manual version selection and curated learner-facing notes over continuous automated software release.
_Avoid_: Semantic-release default flow, continuous automated release

**Manual Version Selection**:
The maintainer chooses the learning product version number at release time. The version reflects editorial curriculum impact, not an automatically inferred software change level.
_Avoid_: Auto-bumped version, commit-derived version

**Release Changelog Entry**:
A manually written learner-facing summary for one learning product version that is added to `CHANGELOG.md` and reused for the GitHub Release. It is part of the release record, not a separate optional note.
_Avoid_: Uncommitted notes, auto-generated commit summary

**Stable Release Branch**:
The `main` branch that represents the learner-trusted stable state of the curriculum and is the only branch allowed to produce a learning product version.
_Avoid_: Develop release branch, release from any branch

**Default Release Artifact**:
The standard GitHub source archive attached to a tagged release, used without any custom course bundle. It is sufficient because the repository and README remain the primary learner entry point.
_Avoid_: Custom release zip, packaged installer

**Release Promotion Boundary**:
Promotion of content into `main` happens before release and through the normal branch workflow. The release workflow assumes `main` is already stable and does not promote changes across branches by itself.
_Avoid_: Release-driven promotion, branch-sync release job

**Draft Release Review**:
A draft GitHub Release created by the editorial release workflow for maintainer review before public publication. It allows the release record to be checked without immediately announcing the new learning product version to learners.
_Avoid_: Immediate public release, no-review release publish

**Versioned Release Notes File**:
A learner-facing release notes document stored in the repository for one specific learning product version, using a path such as `docs/releases/v1.2.0.md`. The editorial release workflow reads this file instead of collecting long-form notes from GitHub Actions inputs.
_Avoid_: Pasted workflow notes, ad hoc release text

**Release Record File**:
A versioned release notes file that remains in the repository after publication as part of the permanent learning product history. It is not a temporary staging artifact.
_Avoid_: Disposable release draft, deleted notes file

**Release Record Commit**:
A commit created by the release workflow on `main` that records learner-facing release metadata such as the new `CHANGELOG.md` entry. The version tag is created from this commit so the repository history and release record stay aligned.
_Avoid_: Out-of-band changelog edit, tag without release metadata commit
