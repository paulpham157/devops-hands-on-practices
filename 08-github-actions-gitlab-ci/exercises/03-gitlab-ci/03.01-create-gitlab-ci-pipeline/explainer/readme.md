# Create a GitLab CI Pipeline

GitLab CI reads pipeline configuration from:

```text
.gitlab-ci.yml
```

The basic model is:

```text
stages define order
jobs choose a stage
script defines commands
artifacts preserve files after a job
rules decide when a job appears in a pipeline
```

A minimal test job can use a language image directly, such as `python:3.12-slim`.
