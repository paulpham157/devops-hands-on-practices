# Solution: Project Graph vs Task Graph

The project graph shows that `web` depends on `shared-ui`, `shared-ui` depends on `shared-utils`, and `api` depends on `shared-utils`.

For build tasks, the task graph should build dependencies first. `shared-utils` comes before `shared-ui`, and `shared-ui` comes before `web`. `api` also depends on `shared-utils`.

Changing `shared-utils` can affect both `web` and `api` because both depend on it directly or indirectly.

Task order matters because downstream builds or tests may need dependency outputs.
