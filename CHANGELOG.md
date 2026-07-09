# Changelog

## Unreleased

This release turns the course into a more explicit AI-collaborative learning
workspace. Learners can ask an AI agent to guide study, explain lessons,
validate exercises, and review practice attempts against lesson goals.

### Added

- Added the `dohp-how-to-learn` agent skill for collaborative learning with AI:
  choosing a lesson path, explaining concepts, guiding exercises, and helping
  learners validate progress.
- Added the `dohp-review-my-practice` agent skill for AI-assisted practice
  review: checking command output, written answers, manifests, configs, and
  exercise completion signals against the lesson goal.
- Added Lesson 39, `aws-nx-plugin`, as an AWS-focused Nx plugin case study for
  generated websites, APIs, agents, connections, CDK infrastructure, Terraform
  infrastructure, and production review boundaries.
- Added Lesson 40, `nx-workspace`, covering Nx workspace concepts, project and
  task graphs, inferred tasks, caching, affected CI, `nx.json`, plugin
  selection, custom plugins, and adoption tradeoffs.

### Improved

- Expanded Nx plugin ecosystem guidance with official plugin categories,
  community plugin evaluation, registry metadata checks, AWS plugin comparison,
  and organization-specific plugin workflow notes.
- Refined Lesson 40 with current Nx documentation concepts, including modern
  workspace shape guidance, inferred task behavior, cache inputs, Docker and
  release integration, and plugin registry due diligence.
- Clarified that Lesson 39 is an applied AWS plugin lesson, while Lesson 40 is
  the foundational Nx Workspace lesson.

### How To Use The AI Skills

Use these two command-style prompts with an AI agent that can access this repo:

```text
Use dohp-how-to-learn to help me choose a DevOps lesson and study it step by step.
```

```text
Use dohp-review-my-practice to review my exercise attempt against the lesson goal.
```

### Notes For Version Bump

- This release adds new curriculum content and agent-facing learning support.
  It is a content/learning feature release, not a breaking change to existing
  lessons.
