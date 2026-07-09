# Nx Mental Model

Nx is a build system and workspace intelligence layer. It uses metadata about projects, tasks, files, and dependencies to decide what should run and what can be skipped.

## Project Graph

The project graph maps projects and their dependencies.

Examples of projects:

- app
- library
- package
- API service
- e2e test project
- infrastructure project

The graph helps answer:

- Which projects depend on this library?
- Which projects are affected by this file change?
- Which tasks must run before another task?

## Task Graph

The task graph maps work to execute.

Example:

```text
build shared-ui -> build web-app -> e2e web-app
test shared-utils -> test api
```

The task graph is different from the project graph. The project graph describes code relationships. The task graph describes execution order.

## Computation Hashing And Cache

Nx decides whether a task can be reused by hashing inputs:

- project source files
- dependency outputs
- relevant configuration
- environment inputs if configured
- command arguments

If the hash matches a previous run, Nx can restore the cached output instead of running the task again.

## Affected Execution

`nx affected` combines Git changes with the project graph.

It answers:

1. Which files changed?
2. Which projects own those files?
3. Which projects depend on those projects?
4. Which target should run for that affected set?

Example:

```bash
nx affected -t test --base=origin/main --head=HEAD
```
