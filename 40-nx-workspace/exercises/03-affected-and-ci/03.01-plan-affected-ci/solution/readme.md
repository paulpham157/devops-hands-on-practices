# Solution: Plan Affected CI

One valid sequence:

```bash
pnpm install --frozen-lockfile
nx affected -t lint test build --base=origin/main --head=HEAD
```

Then publish test reports or build artifacts for tasks that produce them.

`base` and `head` matter because Nx needs a Git comparison range to determine which files changed and which projects are affected.
