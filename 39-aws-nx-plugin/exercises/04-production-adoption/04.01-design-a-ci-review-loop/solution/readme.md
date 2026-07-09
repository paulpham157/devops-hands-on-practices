# Solution: Design a CI Review Loop

A useful loop:

1. Install dependencies from the lockfile.
2. Run format, lint, typecheck, and tests for affected projects.
3. Build generated frontend and API projects.
4. Produce `cdk diff` or `terraform plan` for infrastructure review.
5. Require reviewers to inspect IAM, auth, endpoints, outputs, and resource names.
6. Deploy only from a controlled branch or environment with approved credentials.

Pull request checks should prove code quality and show intended infrastructure changes. Deployment permissions should be separate and more restricted.
