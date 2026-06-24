# Solution: Troubleshoot a Container-like Linux System

Alpine usually has:

```text
/bin/sh
```

Bash is usually not installed by default.

The user in this lab is commonly root because the base images are simple training containers. Production app containers should prefer non-root users.

The current working directory should be:

```text
/workspace
```

If an app failed to start, first check:

- command and entrypoint
- current user
- working directory
- file presence
- file permissions
- environment variables
- process output
- listening port
- exit code

