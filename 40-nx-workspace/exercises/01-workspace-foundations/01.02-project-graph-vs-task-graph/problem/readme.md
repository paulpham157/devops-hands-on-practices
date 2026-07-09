# Problem: Project Graph vs Task Graph

Open:

```text
workspace-maps/mental-model.md
```

Given this relationship:

```text
web -> shared-ui -> shared-utils
api -> shared-utils
```

Answer:

1. What does the project graph show?
2. What does the task graph show for `nx run-many -t build`?
3. Why might changing `shared-utils` affect both `web` and `api`?
4. Why is task order important?

Completion rule: you can explain why project relationships and task execution order are related but different.
