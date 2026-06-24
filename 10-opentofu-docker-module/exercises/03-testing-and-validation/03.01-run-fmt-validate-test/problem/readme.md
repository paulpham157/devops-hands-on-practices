# Problem: Run the Safety Checks

From the lesson root:

```bash
./scripts/format-validate.sh
./scripts/test.sh
```

Then read the test file:

```bash
sed -n '1,200p' tests/plan.tftest.hcl
```

Answer:

1. Which default container name does the first test expect?
2. Which default URL does the first test expect?
3. Which values does the second test override?
4. Why is `command = plan` useful for a local lab?
