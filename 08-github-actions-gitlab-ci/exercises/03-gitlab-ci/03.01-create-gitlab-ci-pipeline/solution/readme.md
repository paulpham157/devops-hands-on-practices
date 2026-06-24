# Create a GitLab CI Pipeline

The file must be at repository root:

```text
.gitlab-ci.yml
```

The first successful job should be:

```text
test
```

It runs:

```bash
python -m pytest -q --junitxml=build/test-results.xml
python -m py_compile app.py
```

If the pipeline does not start, check:

- The file is named exactly `.gitlab-ci.yml`.
- GitLab CI/CD is enabled for the project.
- A runner is available for the project.
- The branch is allowed by the job `rules`.
