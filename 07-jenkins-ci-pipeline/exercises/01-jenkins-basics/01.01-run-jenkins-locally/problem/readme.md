# Run Jenkins Locally

## Task

Start Jenkins and confirm the sample job exists.

## Steps

```bash
cd 07-jenkins-ci-pipeline
docker compose up --build
```

Open:

```text
http://localhost:8085
```

Login:

```text
admin / admin
```

Find the job:

```text
docker-course-sample-app
```

## Done When

You can open the job page and see a `Build Now` button.

