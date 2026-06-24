# Jenkins Exercises

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

Each exercise has:

- `explainer/readme.md`: concept notes.
- `problem/readme.md`: task instructions.
- `solution/readme.md`: one possible solution.

## Exercise Order

1. `01.01-run-jenkins-locally`
2. `01.02-create-first-pipeline`
3. `02.01-run-tests-in-docker`
4. `02.02-build-and-smoke-test-image`
5. `03.01-add-post-actions-and-artifacts`

## Completion Rule

Do not stop at "the file looks right." Finish each exercise by running the Jenkins job and checking console output.

