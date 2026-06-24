# Problem: Shell Script Safety

Inspect:

```text
scripts/permissions-demo.sh
scripts/text-pipeline-demo.sh
scripts/validate.sh
```

Answer:

1. Why do these scripts start with `set -eu`?
2. Find two examples of quoted variables.
3. Why is `rm -rf "$SANDBOX"` safer than `rm -rf $SANDBOX`?
4. Why does `validate.sh` use `test -s` for files?
5. When would you choose Python or Go instead of shell?

