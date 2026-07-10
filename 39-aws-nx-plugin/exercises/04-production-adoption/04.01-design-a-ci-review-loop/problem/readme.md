# Problem: Design a CI Review Loop

Design a CI review loop for a generated AWS Nx workspace.

Include:

1. checks for generated application code.
2. checks for generated infrastructure code.
3. where to produce a CDK diff or Terraform plan.
4. which step should require controlled credentials.
5. what reviewers should inspect before merge.

Completion rule: you can separate pull request checks from deployment permissions.
