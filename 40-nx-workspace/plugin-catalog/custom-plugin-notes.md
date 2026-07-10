# Custom Plugin Notes

Custom plugins are useful when a repo repeats the same workflow often enough to
justify maintaining automation. Start with official Nx plugins, then evaluate
community plugins, then build an internal plugin only when the gap is specific
to the organization.

## Good Reasons To Create A Custom Plugin

- standardize service scaffolding
- enforce project boundaries
- generate boilerplate that many teams need
- infer tasks for an internal tool
- add project graph edges for files Nx cannot understand by default
- wrap a fragile command behind a stable executor
- maintain migrations when generated project shapes evolve
- keep generated code, config, and dependencies synchronized during upgrades
- codify platform team expertise for every product team

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
- compatibility checks against official Nx plugin APIs
- compatibility checks when Nx changes

## Useful Starting Point

Use `@nx/plugin` when building custom plugin features such as:

- generators for repeatable project setup
- executors for controlled task execution
- migrations for safe upgrades
- project graph plugins for custom dependency discovery
- sync generators for keeping files aligned with workspace state

Before creating a custom plugin, check whether an official Nx plugin or a
well-maintained community plugin already solves the problem.

## Organization-Specific Plugin Workflow

A common first custom plugin is not a complex executor. It is a local generator
that encodes repository conventions:

- call an official generator with approved defaults
- add required tags such as `scope:*`
- place projects in expected folders
- update test, lint, or build configuration after files are generated
- run formatting and any post-generation tasks in order

This is different from documentation. Documentation tells developers what to do;
the generator makes the default path match the standard.

Escalate to a local executor, inferred task, or project graph plugin only when
the team has custom tooling or dependency discovery that normal generators and
official plugins cannot model.
