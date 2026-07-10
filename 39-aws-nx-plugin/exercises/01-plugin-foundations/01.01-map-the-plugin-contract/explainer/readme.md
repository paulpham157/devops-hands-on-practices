# Explainer: Map the Plugin Contract

This lesson assumes Nx provides the workspace model. Use `40-nx-workspace` for
the full explanation of projects, generators, tasks, dependencies, caching, and
affected builds.

`@aws/nx-plugin` adds AWS-focused generators on top of that model. It can
scaffold application projects, infrastructure projects, authentication wiring,
and connections between projects.

The plugin is not the same thing as AWS itself. It creates code and
infrastructure definitions that still need review, testing, and deployment
through controlled credentials.
