---
name: dohp-review-my-practice
description: Use this skill when working inside the devops-course repository to review a learner's practice work, command output, written answers, manifests, configs, or exercise attempt; identify gaps against the lesson goal; avoid generic approval; and give actionable feedback, hints, and next steps without collapsing straight into the final solution.
---

# Dohp Review My Practice

## Overview

Use this skill to review learner work inside this repository. The goal is to judge how well the learner's attempt matches the current lesson or exercise, point out concrete gaps, and decide what the learner should fix next.

Review against the repository artifacts first:

- lesson `README.md`
- exercise `explainer/readme.md`
- exercise `problem/readme.md`
- exercise `solution/readme.md`
- `scripts/validate.sh` or other lesson-local checks

## Review Workflow

### 1. Establish review target

Identify:

- which lesson or exercise is being attempted
- what artifact is being reviewed
- whether the task is runnable, reasoning-based, or design-based
- what the explicit completion rule is

If the exercise already defines a completion rule, treat it as the minimum acceptance bar.

### 2. Compare the attempt to the lesson goal

Judge the learner attempt on:

- correctness
- completeness
- understanding
- verification quality
- production tradeoff awareness when relevant

Do not review only for syntax. Check whether the learner actually demonstrated the concept the exercise is trying to teach.

### 3. Give findings first

When there are problems, present them as review findings ordered by severity:

1. incorrect concept or wrong behavior
2. missing required step or missing verification
3. partially correct but weak explanation
4. production reasoning gap

Be concrete. Point to the file, command, output, or concept that is missing or incorrect.

### 4. Calibrate the response

Use the lightest useful response first:

1. pass with one refinement
2. mostly correct, but here are the gaps
3. not correct yet, here is the next fix
4. reset the approach because the learner is solving the wrong problem

Do not say "looks good" unless you can state why it satisfies the exercise.

### 5. End with next action

Always end with one of these:

- rerun a command
- answer a follow-up reasoning question
- patch one concrete file or manifest
- attempt the next exercise

## Review Rules

- Default to a code-review mindset: findings first, summary second.
- Avoid vague praise.
- Tie feedback to the current lesson objective, not to generic best practices alone.
- Distinguish between "passes this lesson" and "production would need more".
- If the learner pasted output, use the real output as evidence.
- If the learner only described what they did, say what cannot be verified yet.
- If the learner asks for strict grading, be strict.

## Skill Outputs

Good outputs for this skill include:

- pass or not-yet verdict for an exercise
- concrete review findings with evidence
- missing verification steps
- concept correction in plain language
- a next-attempt checklist
- a short follow-up quiz to confirm understanding

## Scripts

Use bundled scripts when a deterministic review scaffold is useful:

- `scripts/review_checklist.py <lesson-or-exercise-path>` prints a review checklist grounded in the target lesson or exercise.
- `scripts/extract_completion_rule.py <exercise-path>` extracts explicit completion rules from an exercise problem file when present.

## Read These References When Needed

- For reusable review formats and severity rules, read `references/review-patterns.md`.
- For completion standards and evidence expectations, read `references/completion-signals.md`.
