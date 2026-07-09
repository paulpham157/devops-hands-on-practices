# Custom Plugin Notes

Custom plugins are useful when a repo repeats the same workflow often enough to justify maintaining automation.

## Good Reasons To Create A Custom Plugin

- standardize service scaffolding
- enforce project boundaries
- generate boilerplate that many teams need
- infer tasks for an internal tool
- add project graph edges for files Nx cannot understand by default
- wrap a fragile command behind a stable executor

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
