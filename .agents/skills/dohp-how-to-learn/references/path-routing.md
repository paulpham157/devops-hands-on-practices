# Path Routing

Use this file when the learner asks what to study next or which path fits their goal.

## Inputs To Consider

- learner background
- target role
- time budget
- whether they want local hands-on work or architecture reasoning
- whether they care more about CI/CD, Kubernetes, IaC, security, cloud, or reliability

## Default Routing

Route in two stages:

1. Identify the learner's starting level from `LEARNING_PATHS.md`. A learner who says they are new or beginner starts at Level 1 even if they also mention a target job or tool.
2. After the learner can show Level 2 shared-core evidence, choose a specialization overlay that matches their goal. An overlay never bypasses the shared core.

Use the learner-facing `LEARNING_PATHS.md` as the exact source of lesson order, entry checks, shared production-owner core, resume guidance, and goal-oriented routes. Do not reconstruct a shorter sequence from tool names alone.

When a learner is ready to advance, use `docs/curriculum/assessments/level-exit-rubrics.md`. A learner who cannot produce the required evidence should stay at the current level and receive one concrete next exercise.

For an experienced learner, ask for concrete evidence: a validated lab, pipeline/IaC configuration, deployment artifact, dashboard/trace, or written operational decision. Tool familiarity alone is not enough to skip a level.

## Output Style

When recommending a path:

1. name the best-fit path
2. explain why it fits this learner
3. give the next 1 to 3 lessons only
4. say what the learner will be able to do after those lessons
