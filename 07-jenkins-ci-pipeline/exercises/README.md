# Exercises: Jenkins CI Pipeline with Docker

Run Jenkins first:

```bash
cd 07-jenkins-ci-pipeline
docker compose up --build
```

Then open:

```text
http://localhost:8085
```

Login:

```text
admin / admin
```

## Sections

1. `01-jenkins-basics`
   - Run Jenkins locally.
   - Create a first Pipeline job.
2. `02-ci-with-docker`
   - Run tests in Docker.
   - Build and smoke-test an image.
   - Parameterize image tags.
3. `03-pipeline-hardening`
   - Archive build metadata.
   - Add timeouts and cleanup controls.

## Completion Target

Do not stop at "the file looks right." Finish each exercise by running the Jenkins job and checking console output.

By the end, you should be able to explain how a Jenkinsfile turns source code into a tested image with retained build evidence.
