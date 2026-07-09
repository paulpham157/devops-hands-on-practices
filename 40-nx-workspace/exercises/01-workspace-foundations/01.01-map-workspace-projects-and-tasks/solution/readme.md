# Solution: Map Workspace Projects and Tasks

Likely projects are `web`, `api`, `shared-ui`, and `web-e2e`.

Typical targets:

- `web`: build, test, lint, serve
- `api`: build, test, lint, serve
- `shared-ui`: build, test, lint
- `web-e2e`: e2e

Useful inspection commands include `nx graph`, `nx show projects`, `nx show project <project-name>`, and `nx list`.

Mapping first matters because plugin choices should support real project and task boundaries.
