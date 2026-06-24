# Explainer: File Permissions

Permissions are expressed for:

```text
user group others
```

Each can have:

```text
r read
w write
x execute
```

Example:

```text
-rwxr-x--- script.sh
```

This means:

- owner can read, write, execute
- group can read and execute
- others have no access

Use `chmod` to change permissions and `chown` to change ownership.

