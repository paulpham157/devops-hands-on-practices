# Release Notes: AI-Collaborative DevOps Learning

This release prepares the course for a more collaborative learning workflow
between the learner and an AI agent. The repository now includes agent-facing
skills, new Nx-focused lessons, and release notes for the next version bump.

## What Is New

- AI-guided learning support through `dohp-how-to-learn`.
- AI-assisted practice review through `dohp-review-my-practice`.
- A new AWS Nx Plugin lesson for AWS application scaffolding with generated
  websites, APIs, agents, connections, CDK, Terraform, and production review.
- A new Nx Workspace lesson for project graphs, task graphs, inferred tasks,
  caching, affected CI, plugin selection, and custom plugin design.
- A changelog entry that frames this as a content and learning-support release.

## How Learners Use It

Use these two command-style prompts with an AI agent that can access this repo:

```text
Use dohp-how-to-learn to help me choose a DevOps lesson and study it step by step.
```

```text
Use dohp-review-my-practice to review my exercise attempt against the lesson goal.
```

## Release Summary

This is a learning feature release. It does not break existing lesson paths.
The main change is that the curriculum can now be used as an AI-collaborative
study workspace: the learner practices locally, the AI agent helps navigate the
course, and the review skill checks practice work against explicit lesson goals.

## Validation

The release branch was validated with:

```bash
./scripts/validate-all.sh
```
