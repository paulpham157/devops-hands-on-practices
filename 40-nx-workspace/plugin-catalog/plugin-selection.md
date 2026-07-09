# Plugin Selection

Nx plugins connect tools to the Nx graph, task runner, generator system, and
upgrade workflow. A good plugin codifies tool-specific expertise so each team
does not need to rediscover the same Nx integration details.

## What A Plugin Can Provide

A plugin may provide:

- inferred tasks
- generators
- executors
- migrations
- cache inputs and outputs
- dependency and tool configuration updates
- sync generators
- graph nodes
- graph dependencies
- task splitting for large test suites

Not every plugin provides every capability. Choose based on the job you need.

## Plugin Types

Nx has three practical plugin sources:

- official Nx plugins maintained by the Nx team
- community plugins maintained outside the Nx core team
- local or internal plugins built for one organization

Prefer an official plugin when it covers the tool. Use a community plugin when
it is actively maintained and fits a real gap. Build a custom plugin only when
the workflow is repeated, owned, and specific enough to justify maintenance.

## Common Plugin Families

| Family | Typical plugins | Use when |
| --- | --- | --- |
| JavaScript and TypeScript | `@nx/js`, `@nx/node` | You need libraries, packages, or Node apps |
| Frontend | `@nx/react`, `@nx/angular`, `@nx/vue`, `@nx/next`, `@nx/remix`, `@nx/nuxt` | You need framework-aware app and library generators |
| Mobile | `@nx/react-native`, `@nx/expo`, `@nx/detox` | You need mobile app, Expo, or mobile e2e integration |
| Test tools | `@nx/jest`, `@nx/vitest`, `@nx/playwright`, `@nx/cypress`, `@nx/storybook` | You need test targets, task atomization, and configuration integration |
| Build tools | `@nx/vite`, `@nx/webpack`, `@nx/rspack`, `@nx/rsbuild`, `@nx/esbuild`, `@nx/rollup` | You need build or dev-server task integration |
| Backend | `@nx/node`, `@nx/express`, `@nx/nest`, community plugins | You need service and API project patterns |
| Non-JS ecosystems | `@nx/gradle`, `@nx/maven`, `@nx/dotnet`, community plugins | You need Java, JVM, .NET, or mixed-language graph support |
| Containers | `@nx/docker` | You need container build tasks in the graph |
| Architecture rules | `@nx/eslint`, `@nx/eslint-plugin`, `@nx/module-federation` | You need module boundaries, lint integration, or micro frontend support |
| Cloud or platform | `@aws/nx-plugin`, community plugins | You need cloud-specific app and infrastructure scaffolding |
| Plugin authoring | `@nx/plugin` | You need to create custom generators, executors, migrations, or graph integrations |

## Selection Questions

Ask:

1. Does this plugin understand a tool already in the repo?
2. Does it infer tasks from existing config?
3. Does it add useful generators or only extra ceremony?
4. Does it improve project graph accuracy?
5. Does it support the team's CI and caching model?
6. Does it provide migrations when the tool or generated shape changes?
7. Is it official, community-maintained, or internal?
8. Who will maintain generated code and migrations?
9. Does it need to be registered in `nx.json` to infer tasks?

## Capability Checklist

Use this checklist when evaluating a plugin:

- Can it infer targets from existing tool config?
- Can it configure safe cache inputs and outputs?
- Can it generate or modify code without hiding reviewable changes?
- Can it update dependencies and config during upgrades?
- Can its executors run the tool better than a plain shell command?
- Can it add missing graph nodes or dependencies?
- Can it split large e2e or test tasks when CI needs parallelism?

## Scoping Plugins

Use `nx.json` plugin configuration to include or exclude paths when a plugin should apply only to part of the repo.

This matters in mixed workspaces where one tool should not infer tasks for every package.

## Release And Docker

Nx release can coordinate versioning, changelog, and publishing workflows. With Docker support, projects with Dockerfiles can participate in image build and publishing flows.

Treat release automation as production workflow code:

- review versioning strategy
- review package or image publishing credentials
- review generated changelogs
- review Docker tags and repository names
