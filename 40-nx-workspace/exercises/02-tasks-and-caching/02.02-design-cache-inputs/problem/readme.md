# Problem: Design Cache Inputs

Open:

```text
workspace-maps/mental-model.md
workspace-maps/ci-workflow.md
```

For a frontend build task, decide whether each item should affect the cache:

1. app source files
2. shared UI source files
3. Vite config
4. package lockfile
5. API base URL environment variable
6. unrelated README file

Completion rule: you can explain why each selected input should or should not invalidate the cache.
