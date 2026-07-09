# nx.json And Boundaries

An Nx workspace is any directory with an `nx.json` file at its root. That file configures how Nx behaves across the repository.

## Common nx.json Responsibilities

`nx.json` can configure:

- plugins and their include or exclude globs
- target defaults
- named inputs for caching
- generator defaults
- release settings
- sync generator settings
- Nx Cloud settings
- terminal UI behavior

## Plugin Registration

Plugins can be listed as strings or objects.

```json
{
  "plugins": [
    "@nx/vite/plugin",
    {
      "plugin": "@nx/jest/plugin",
      "include": ["packages/**/*"],
      "exclude": ["**/*-e2e/**/*"]
    }
  ]
}
```

Use `include` and `exclude` when a plugin should infer tasks only for part of the repo.

## Target Defaults

Target defaults let teams avoid repeating common task configuration.

```json
{
  "targetDefaults": {
    "build": {
      "dependsOn": ["^build"],
      "inputs": ["production", "^production"]
    }
  }
}
```

Review target defaults carefully because they affect many projects at once.

## Named Inputs

Named inputs are reusable input sets used for cache hashing.

They are the modern replacement for many old global implicit dependency patterns.

## Boundaries And Conformance

Nx can support code ownership and boundary rules through tags, lint rules, and conformance-style checks.

Use boundaries when a workspace needs rules such as:

- UI projects cannot import database code.
- feature libraries cannot import app-only code.
- internal packages must go through public APIs.
- platform-owned code requires owner review.

Boundary rules are useful only when project tags and ownership terms are kept accurate.
