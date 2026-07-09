# Solution: Map the Plugin Contract

1. `@aws/nx-plugin` can generate websites, APIs, agents, infrastructure projects, auth wiring, and project connections.
2. Websites, APIs, and agents are application code. CDK or Terraform projects are infrastructure code. Website auth is auth wiring. The connection generator creates a project boundary contract.
3. Generated files still need review because scaffolding can create IAM, auth, API, and infrastructure behavior that affects production risk.
4. Security-sensitive boundaries include IAM permissions, Cognito auth, API exposure, environment variables, secrets, and generated IaC.
5. If the workspace contract is unclear, review `40-nx-workspace` for projects, targets, project graphs, task graphs, inferred tasks, and caching.
