# Completion Signals

Use these signals to decide whether a learner attempt is complete enough.

## Evidence Hierarchy

Prefer evidence in this order:

1. actual command output
2. file content or manifest content
3. validation script result
4. structured written explanation
5. unsupported description

The lower the evidence quality, the more careful the verdict should be.

## Acceptance Questions

Ask:

1. Did the learner satisfy the explicit task?
2. Did they verify the result?
3. Can they explain the concept in plain language?
4. Did they avoid a major misconception?
5. If the lesson implies tradeoffs, did they mention the important one?

## Example Verdicts

### Pass

Use when the learner met the task, verified it, and did not show a major misunderstanding.

### Mostly correct

Use when the learner solved the main task but skipped verification or explanation depth.

### Not correct yet

Use when the learner is close but the task is still incomplete or behavior is unproven.

### Wrong direction

Use when the learner is optimizing the wrong thing or solving a different problem than the exercise asks for.
