# Change Container Name

Expected plan behavior may include replacement for the Docker container.

Look for symbols in the plan:

```text
~ update in-place
-/+ destroy and then create replacement
```

The important practice is to read the action before approving:

```bash
terraform plan
```
