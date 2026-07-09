# Plugin Selection

Nx plugins connect tools to the Nx graph, task runner, and generator system.

## What A Plugin Can Provide

A plugin may provide:

- inferred tasks
- generators
- executors
- migrations
- graph nodes
- graph dependencies
- task splitting for large test suites

Not every plugin provides every capability. Choose based on the job you need.

## Common Plugin Families

| Family | Typical plugins | Use when |
| --- | --- | --- |
| JavaScript and TypeScript | `@nx/js`, `@nx/node` | You need libraries, packages, or Node apps |
| Frontend | `@nx/react`, `@nx/angular`, `@nx/vue`, `@nx/next` | You need framework-aware app and library generators |
| Test tools | `@nx/jest`, `@nx/vitest`, `@nx/playwright`, `@nx/cypress`, `@nx/storybook` | You need test targets and configuration integration |
| Build tools | `@nx/vite`, `@nx/webpack`, `@nx/rspack`, `@nx/esbuild`, `@nx/rollup` | You need build or dev-server task integration |
| Backend | `@nx/node`, `@nx/nest`, community plugins | You need service and API project patterns |
| Non-JS ecosystems | `@nx/gradle`, `@nx/maven`, `@nx/dotnet`, community plugins | You need Java, JVM, .NET, or mixed-language graph support |
| Containers | `@nx/docker` | You need container build tasks in the graph |
| Cloud or platform | `@aws/nx-plugin`, community plugins | You need cloud-specific app and infrastructure scaffolding |

## Selection Questions

Ask:

1. Does this plugin understand a tool already in the repo?
2. Does it infer tasks from existing config?
3. Does it add useful generators or only extra ceremony?
4. Does it improve project graph accuracy?
5. Does it support the team's CI and caching model?
6. Who will maintain generated code and migrations?

## Scoping Plugins

Use `nx.json` plugin configuration to include or exclude paths when a plugin should apply only to part of the repo.

This matters in mixed workspaces where one tool should not infer tasks for every package.
