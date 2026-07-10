# Solution: Design Cache Inputs

Likely cache inputs:

- app source files
- shared UI source files
- Vite config
- package lockfile
- API base URL environment variable if it changes bundled output

An unrelated README usually should not invalidate a frontend build.

The key rule is simple: if changing the file, config, environment value, or argument can change the task output, it belongs in the hash inputs.
