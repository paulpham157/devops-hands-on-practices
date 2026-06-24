# Explainer: Format, Validate, and Test

Use a fast static check before running real changes:

```bash
tofu fmt -recursive -check
tofu init -backend=false
tofu validate
```

`tofu fmt` keeps HCL style consistent.

`tofu validate` checks whether the configuration is syntactically valid and internally consistent.

`tofu test` runs test files such as:

```text
tests/plan.tftest.hcl
```

This lesson uses `command = plan`, so the test verifies planned values without creating Docker resources.
