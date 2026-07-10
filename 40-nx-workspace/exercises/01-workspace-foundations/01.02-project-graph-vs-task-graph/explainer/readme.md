# Explainer: Project Graph vs Task Graph

The project graph models code dependencies between projects.

The task graph models execution order for tasks.

Example: `web` may depend on `shared-ui` in the project graph. When running builds, the task graph may run `build shared-ui` before `build web`.

Confusing the two graphs leads to weak CI design.
