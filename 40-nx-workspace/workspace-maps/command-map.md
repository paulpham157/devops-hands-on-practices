# Nx Command Map

Use this map to classify commands before running them in a real workspace.

## Inspect

```bash
nx graph
nx show projects
nx show project <project-name>
nx list
```

These commands help understand the workspace before changing it.

## Run Tasks

```bash
nx <target> <project>
nx run <project>:<target>
nx run-many -t test lint build
nx affected -t test build
```

These commands execute known targets.

## Generate Or Change Code

```bash
nx generate <plugin>:<generator>
nx g <plugin>:<generator> --dry-run
nx add <plugin-package>
nx migrate latest
```

These commands can change workspace files. Use `--dry-run` when exploring generator output.

## Configure

Common files:

```text
nx.json
project.json
package.json
tsconfig.base.json
tool-specific config files
```

Modern plugins can infer tasks from existing tool config, so not every project needs explicit target configuration in `project.json`.
