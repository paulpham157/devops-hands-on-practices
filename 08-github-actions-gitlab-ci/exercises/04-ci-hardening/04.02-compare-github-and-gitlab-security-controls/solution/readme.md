# Compare GitHub and GitLab Security Controls

Both platforms need least privilege, protected secrets, and trusted runners.

GitHub Actions emphasizes `permissions:` on the workflow token and environment or repo secrets. GitLab CI emphasizes protected variables, job rules, and runner trust boundaries.

If either platform gives broad token access to untrusted jobs, the pipeline can mutate packages, repos, or deployment targets unexpectedly.
