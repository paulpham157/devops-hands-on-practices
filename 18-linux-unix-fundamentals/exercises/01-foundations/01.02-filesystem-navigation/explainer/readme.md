# Explainer: Filesystem Navigation

Unix-like systems organize everything under one root:

```text
/
```

Common directories:

- `/etc` for configuration
- `/var` for variable data such as logs and caches
- `/tmp` for temporary files
- `/home` for user home directories
- `/proc` for Linux process and kernel information
- `/dev` for device files
- `/bin` and `/usr/bin` for commands

Containers usually have smaller filesystems than full virtual machines.

