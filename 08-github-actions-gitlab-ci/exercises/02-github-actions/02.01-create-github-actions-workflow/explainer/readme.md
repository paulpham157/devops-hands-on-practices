# Create a GitHub Actions Workflow

GitHub Actions workflows live in:

```text
.github/workflows/
```

Each workflow file describes:

- `name`: display name in the Actions tab.
- `on`: events that trigger the workflow.
- `permissions`: token permissions for the workflow.
- `jobs`: work units that run on a runner.
- `steps`: commands or reusable actions inside a job.

Keep workflows small at first. A good first workflow runs tests and uploads a report.
