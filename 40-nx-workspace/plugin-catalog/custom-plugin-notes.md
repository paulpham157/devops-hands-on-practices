# Custom Plugin Notes

Custom plugins are useful when a repo repeats the same workflow often enough to justify maintaining automation.

## Good Reasons To Create A Custom Plugin

- standardize service scaffolding
- enforce project boundaries
- generate boilerplate that many teams need
- infer tasks for an internal tool
- add project graph edges for files Nx cannot understand by default
- wrap a fragile command behind a stable executor
- maintain migrations when generated project shapes evolve

## Bad Reasons To Create A Custom Plugin

- avoiding documentation
- abstracting a one-off script
- hiding a command nobody understands
- generating code that teams cannot review
- replacing a standard plugin that already covers the use case

## Plugin Maintenance Cost

Custom plugins become part of the platform contract. They need:

- tests
- migrations
- versioning
- examples
- owner review
- compatibility checks when Nx changes

## Useful Starting Point

Use `@nx/plugin` when building custom plugin features such as generators, executors, and migrations.

Before creating a custom plugin, check whether an official Nx plugin or a well-maintained community plugin already solves the problem.
