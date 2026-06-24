# Explainer: Troubleshoot a Container-like Linux System

When a containerized app fails, Linux basics usually come first.

Checklist:

```text
Who am I?
Where am I?
What OS/userland is this?
What process is running?
What files exist?
What permissions do they have?
What port is listening?
What did the last command return?
```

Minimal images may not include Bash, package managers, curl, ps, or network tools.

