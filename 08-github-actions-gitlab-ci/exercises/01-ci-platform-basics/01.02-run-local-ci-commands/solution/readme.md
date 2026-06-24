# Run Local CI Commands

The passing command is:

```bash
cd 08-github-actions-gitlab-ci
chmod +x scripts/run-local-ci.sh
./scripts/run-local-ci.sh
```

A failing edit looks like:

```python
return jsonify({"status": "broken"})
```

The test failure should point to `tests/test_app.py`.

Fix it back:

```python
return jsonify({"status": "ok"})
```

Then run the script again. The expected final output includes:

```text
Smoke test passed
```
