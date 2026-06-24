# Artifacts, Cache, and Secrets

## Task

Review both CI files and mark where each concern appears:

1. Artifact upload or artifact report.
2. Dependency cache.
3. Docker image publishing permissions.
4. Registry credentials.
5. Job rule that limits publishing.

Then answer:

```text
Which job has the highest blast radius if misconfigured?
```

## Done When

You can explain which jobs should run on pull requests and which jobs should run only on trusted branches or tags.
