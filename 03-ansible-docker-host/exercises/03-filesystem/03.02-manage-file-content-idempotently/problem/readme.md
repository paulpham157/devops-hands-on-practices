# Manage File Content Idempotently

## Task

Add a task that creates a small managed file under `/opt/docker-course`, for example a note or marker file with controlled content.

Run:

```bash
ansible-playbook -i inventory/hosts.ini site.yml
ansible-playbook -i inventory/hosts.ini site.yml
```

## Done When

The first run creates or updates the file. The second run reports no change unless you intentionally edit the desired content in the playbook.
