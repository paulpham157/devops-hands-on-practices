# Problem: Plan Affected CI

Open:

```text
workspace-maps/ci-workflow.md
```

Design a pull request CI command sequence that:

1. installs dependencies.
2. sets a `base` and `head`.
3. runs affected lint, test, and build.
4. records artifacts where needed.

Then explain why `base` and `head` matter.

Completion rule: you can write an affected command that is appropriate for CI.
