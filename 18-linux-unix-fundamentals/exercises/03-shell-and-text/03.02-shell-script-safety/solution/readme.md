# Solution: Shell Script Safety

`set -eu` makes scripts fail on unset variables and failed commands. This catches many mistakes early.

Examples of quoted variables:

```bash
"$SANDBOX"
"$LOG_FILE"
```

`rm -rf "$SANDBOX"` preserves the variable as one argument. Unquoted variables can split into multiple words or expand unexpectedly.

`test -s` checks that a file exists and is not empty.

Choose Python, Go, or another language when logic becomes complex, structured parsing is needed, error handling matters, or tests would be difficult in shell.

