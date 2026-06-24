# Solution: File Permissions

`run.sh` needs the execute bit before the kernel will execute it as a program.

`chmod 640 config.txt` means:

```text
owner: read/write
group: read
others: no access
```

The current user and groups are shown by:

```bash
id
```

Secrets should not be world-readable because any process or user with access to the filesystem could read them.

Production containers should avoid root because a compromised process should have the least privilege possible.

