# Run Jenkins Locally

Expected checks:

```bash
docker compose ps
```

You should see:

```text
jenkins
docker
```

Jenkins logs should show startup completed:

```bash
docker compose logs -f jenkins
```

The lesson image creates an admin user and a sample Pipeline job during first startup. If the job is missing, remove state and retry:

```bash
docker compose down --volumes
docker compose up --build
```

