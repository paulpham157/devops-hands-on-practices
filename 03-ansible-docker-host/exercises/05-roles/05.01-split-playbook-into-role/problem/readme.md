# Split Playbook into Role

## Task

Create a role named `docker_host`:

```text
roles/docker_host/tasks/main.yml
roles/docker_host/defaults/main.yml
roles/docker_host/handlers/main.yml
```

Move package variables to defaults, tasks to `tasks/main.yml`, and handlers to `handlers/main.yml`.

## Done When

`site.yml` calls the role and the playbook still configures the VM successfully.
