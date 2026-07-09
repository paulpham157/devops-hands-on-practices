# Problem: Review CI Cache Risk

Open:

```text
workspace-maps/ci-workflow.md
```

For each situation, identify the risk:

1. CI compares against the wrong base branch.
2. A generated API client is not committed.
3. A build depends on an env var that is not part of cache inputs.
4. A shared library dependency is missing from the project graph.
5. A deployment task uses cached output from another environment.

Completion rule: you can identify when Nx optimization can hide incorrect results.
