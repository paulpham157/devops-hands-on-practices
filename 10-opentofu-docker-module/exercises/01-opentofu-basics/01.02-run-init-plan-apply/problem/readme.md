# Problem: Run the Workflow

From the lesson root:

```bash
./scripts/plan.sh
```

Review the plan output and identify:

1. How many resources will be created?
2. Which module owns the resources?
3. Which local host port will be used?

Then apply:

```bash
tofu apply tfplan
```

Open the app:

```bash
curl -I http://localhost:8095
```

Clean up:

```bash
./scripts/destroy.sh
```
