# Solution: Map the Plugin Contract

1. Nx contributes the workspace model: projects, generators, tasks, and dependency graph.
2. `@aws/nx-plugin` contributes AWS-specific generators for websites, APIs, auth, agents, infrastructure, and connections.
3. Generated files still need review because scaffolding can create IAM, auth, API, and infrastructure behavior that affects production risk.
4. Security-sensitive boundaries include IAM permissions, Cognito auth, API exposure, environment variables, secrets, and generated IaC.
