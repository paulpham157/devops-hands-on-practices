# Design Sampling and Cost Controls

Expected design:

- Keep `batch` and `memory_limiter` processors.
- Prefer collector-managed sampling for shared policy.
- Always retain errors and a useful sample of slow traces.
- Add attributes such as `service.name`, `deployment.environment`, `service.version`, and region.
- Review cost by backend, environment, and service.

Do not put API keys or backend credentials in application source code.
