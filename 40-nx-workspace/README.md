# Lesson 40: Nx Workspace

## Goal

Learn how Nx organizes large repositories through projects, tasks, project graphs, task graphs, caching, affected commands, plugins, and CI optimization.

This lesson teaches:

- what an Nx workspace is and how it differs from a single app or plain package manager workspace.
- how Nx models projects, targets, dependencies, task pipelines, and computation hashing.
- how plugins infer tasks from tool config files and add generators, executors, graph integrations, and migrations.
- how `nx affected` uses Git changes and the project graph to run only relevant tasks.
- how local and remote caching change CI behavior.
- how `nx.json` controls plugins, target defaults, named inputs, release, sync, and Nx Cloud settings.
- how to choose plugin categories across frontend, backend, test tools, build tools, language ecosystems, containers, and cloud-specific workflows.
- when Nx is a good fit and when it adds unnecessary process.

No generated Nx workspace is required for the core exercises. This lesson is offline-first and emphasizes architecture, command planning, and plugin selection.

## Navigation

- Previous lesson: `39-aws-nx-plugin`
- Next lesson: none

## Related Lessons

- `08-github-actions-gitlab-ci`
- `17-language-runtime-containerization`
- `23-iac-cdk-cloudformation-pulumi-terraform`
- `31-backend-for-frontend`
- `39-aws-nx-plugin`

## Mental Model

```text
repo files -> project graph -> task graph -> cached and affected execution -> CI feedback loop
```

Nx does not replace package managers, build tools, or test frameworks. It adds orchestration, graph awareness, caching, generators, and plugin-driven automation around those tools.

## Lab Layout

```text
workspace-maps/       Nx concepts, command maps, and CI workflow notes
plugin-catalog/       Plugin categories and selection notes
scenario-designs/     Adoption and plugin-selection scenarios
scripts/              Validation helper
exercises/            Structured hands-on practice
```

## Core Concepts

| Concept | Meaning | Why it matters |
| --- | --- | --- |
| Workspace | Repository managed by Nx | Gives Nx a place to model projects and tasks |
| Project | App, library, package, service, or tool unit | Lets Nx know what can be built, tested, linted, or deployed |
| Project graph | Dependency map between projects | Powers affected commands and dependency-aware task ordering |
| Task graph | Ordered task execution plan | Prevents running tasks in the wrong order |
| Target | Named task such as `build`, `test`, `lint`, or `e2e` | Makes commands consistent across projects |
| Inferred task | Task discovered from tool config by a plugin | Reduces manual `project.json` configuration |
| Computation hash | Inputs Nx uses to decide cache validity | Lets Nx skip repeat work safely |
| Generator | Code or config scaffolding command | Creates projects, libraries, configs, and migrations consistently |
| Executor | Encapsulated task runner | Gives Nx a standard way to run a tool |
| `nx.json` | Root workspace configuration file | Marks a directory as an Nx workspace and configures plugins, defaults, inputs, release, sync, and cloud settings |
| Nx Daemon | Local background graph process | Speeds project graph computation on developer machines |
| Nx Cloud | Remote cache and CI acceleration service | Shares cache and can distribute tasks across agents |
| Nx Release | Versioning, changelog, and publishing workflow | Helps coordinate releases for packages and Docker images |

## Plugin Categories

Nx has a broad plugin ecosystem. Treat plugins as adapters between Nx's graph/task engine and the tools a repo already uses.

| Category | Example plugins | Typical role |
| --- | --- | --- |
| JavaScript and TypeScript | `@nx/js`, `@nx/node` | Libraries, Node apps, package builds |
| Frontend frameworks | `@nx/react`, `@nx/angular`, `@nx/vue`, `@nx/next` | Apps, libraries, framework-specific tasks |
| Backend frameworks | `@nx/node`, `@nx/nest`, community plugins | APIs and service projects |
| Test tools | `@nx/jest`, `@nx/vitest`, `@nx/playwright`, `@nx/cypress`, `@nx/storybook` | Unit, integration, e2e, and UI docs |
| Build tools | `@nx/vite`, `@nx/webpack`, `@nx/rspack`, `@nx/esbuild`, `@nx/rollup` | Build and dev-server integration |
| Languages and ecosystems | `@nx/gradle`, `@nx/maven`, `@nx/dotnet`, community plugins | Bring non-JS projects into the graph |
| Containers and deployment | `@nx/docker`, cloud-specific plugins | Container builds and deployment workflows |
| Plugin authoring | `@nx/plugin` | Custom generators, executors, migrations, and plugin features |
| Custom plugins | local or published plugins | Add repo-specific generators, inferred tasks, or graph nodes |

## Workspace Shape Notes

Modern Nx docs emphasize enabling the features that fit a repository instead of forcing a hard split between old "integrated" and "package-based" categories.

Nx can be added to:

- a standalone application
- a package-manager workspace
- a large monorepo
- a polyglot repo with JavaScript, Java, .NET, containers, and other ecosystems

The practical question is which features should be adopted first: caching, task orchestration, plugins, affected CI, remote cache, release automation, conformance, or custom generators.

## Safe Practice Rules

- Start by mapping projects and tasks before adding plugins.
- Prefer inferred tasks when plugins support the repo's existing config.
- Scope plugins in `nx.json` when only part of the repo should be inferred.
- Review cache inputs before trusting cache hits for build or release tasks.
- Configure `nx affected` with explicit `base` and `head` values in CI.
- Treat generated code and migrations as reviewable source changes.
- Use custom plugins only when repeated repo-specific automation justifies the maintenance cost.

## Validate

From this lesson directory:

```bash
./scripts/validate.sh
```

This checks required lesson files, shell syntax, YAML syntax for scenarios, and exercise coverage. It does not create or mutate a real Nx workspace.

Optional local inspection commands:

```bash
sed -n '1,220p' workspace-maps/mental-model.md
sed -n '1,220p' workspace-maps/nx-json-and-boundaries.md
sed -n '1,220p' plugin-catalog/plugin-selection.md
```

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover Nx workspace modeling, project and task graphs, inferred tasks, caching, affected commands, plugin selection, CI design, and adoption tradeoffs.

## References

- Nx intro: https://nx.dev/docs/getting-started/intro
- Nx mental model: https://nx.dev/docs/concepts/mental-model
- Inferred tasks: https://nx.dev/docs/concepts/inferred-tasks
- How caching works: https://nx.dev/docs/concepts/how-caching-works
- Affected commands: https://nx.dev/docs/features/ci-features/affected
- Nx plugin registry: https://nx.dev/docs/plugin-registry
- Extending Nx with plugins: https://nx.dev/docs/extending-nx/intro
- `nx.json` reference: https://nx.dev/docs/reference/nx-json
- Project configuration reference: https://nx.dev/docs/reference/project-configuration
- Inputs and named inputs: https://nx.dev/docs/reference/inputs
- Nx daemon: https://nx.dev/docs/concepts/nx-daemon
- Nx release: https://nx.dev/docs/guides/nx-release
