# Explainer: Plan Affected CI

`nx affected` uses Git changes and the project graph to choose which projects need a task.

In CI, always set the comparison range deliberately. Local defaults may not match pull request behavior.

Typical shape:

```bash
nx affected -t lint test build --base=origin/main --head=HEAD
```
