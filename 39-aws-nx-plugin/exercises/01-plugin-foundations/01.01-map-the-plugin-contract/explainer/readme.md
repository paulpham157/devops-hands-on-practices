# Explainer: Map the Plugin Contract

Nx provides the workspace model: projects, generators, tasks, dependencies, and affected builds.

`@aws/nx-plugin` adds AWS-focused generators on top of that model. It can scaffold application projects, infrastructure projects, authentication wiring, and connections between projects.

The plugin is not the same thing as AWS itself. It creates code and infrastructure definitions that still need review, testing, and deployment through controlled credentials.
