# Resources, Recipes, and Idempotence

1. `base::default` establishes the shared baseline.
2. The `template '/etc/docker/daemon.json'` resource is the likely notification source.
3. Templates keep configuration declarative, testable, and parameterized through attributes instead of brittle shell logic.
