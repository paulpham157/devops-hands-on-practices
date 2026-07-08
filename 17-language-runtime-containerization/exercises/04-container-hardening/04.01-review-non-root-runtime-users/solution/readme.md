# Review Non-root Runtime Users

Expected review points:

- Prefer explicit non-root users in runtime stages.
- Avoid privileged ports below `1024` unless there is a specific reason.
- Ensure copied app files are readable by the runtime user.
- Keep compiler toolchains out of final runtime images.

The best hardening change is one that keeps the image runnable and easy to verify with `./scripts/smoke-test.sh`.
