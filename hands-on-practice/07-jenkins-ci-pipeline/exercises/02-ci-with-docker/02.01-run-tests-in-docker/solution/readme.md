# Run Tests in Docker

Example failing edit:

```python
assert response.get_json()["status"] == "broken"
```

Expected Jenkins output:

```text
FAILED tests/test_app.py
```

Fix it back:

```python
assert response.get_json()["status"] == "ok"
```

The stage command in `sample-app/Jenkinsfile` is:

```bash
docker run --rm \
  -v "${COURSE_ROOT}:/workspace/docker-course" \
  -w "${APP_DIR}" \
  "${TEST_IMAGE}" \
  sh -c "python -m pip install -r requirements.txt && python -m pytest -q && python -m py_compile app.py"
```

