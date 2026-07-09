# Nx CI Workflow

Nx is most valuable in CI when it reduces repeat work without hiding risk.

## Basic Pull Request Flow

1. Install dependencies from the lockfile.
2. Set explicit `base` and `head` commits.
3. Run affected lint, test, and build tasks.
4. Restore or populate cache.
5. Publish test and build artifacts where needed.

Example:

```bash
nx affected -t lint test build --base=origin/main --head=HEAD
```

## Remote Cache And Distribution

Nx Cloud can share task results across machines and can distribute work across agents in larger CI pipelines.

Remote cache helps when multiple developers or CI jobs repeat the same task hash. Distribution helps when the affected set still contains enough real work that one machine becomes the bottleneck.

Keep the distinction clear:

- affected execution removes unrelated work.
- caching skips repeated work with the same inputs.
- distribution runs remaining work across multiple agents.

## Cache Review

Caching is useful only when task inputs are correct.

Review:

- source file inputs
- shared config inputs
- environment variables that affect output
- generated files
- dependency outputs
- command arguments

## CI Anti-Patterns

- using affected without a correct base/head
- trusting cache hits for tasks with missing inputs
- generating code in CI without committing the result
- making deployment depend on unreviewed generated files
- treating a package manager workspace as automatically well-modeled by Nx
- distributing tasks before the task graph and cache inputs are trusted
