# Run Local CI Commands

## Task

Run the local CI script:

```bash
cd hands-on-practice/08-github-actions-gitlab-ci
chmod +x scripts/run-local-ci.sh
./scripts/run-local-ci.sh
```

Then break the app intentionally:

1. Edit `sample-app/app.py`.
2. Change `/healthz` to return `"broken"` instead of `"ok"`.
3. Run the script again.
4. Revert the change and confirm the script passes.

## Done When

You have seen one failing run and one passing run.
