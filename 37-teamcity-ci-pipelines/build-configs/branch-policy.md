# Branch Policy

Suggested TeamCity branch policy:

- build `main` on every change
- build `feature-*` branches for fast feedback
- build `release-*` branches with stricter approval flow
- publish release artifacts only from `main` or `release-*`
- map build status back to pull requests before merge
