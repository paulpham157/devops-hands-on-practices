# Create Managed Directory

## Task

Add a task to `site.yml` that creates:

```text
/opt/devops-handson
```

Use owner `root`, group `root`, and mode `0755`.

## Done When

This command shows the directory:

```bash
ansible -i inventory/hosts.ini docker_hosts -m command -a "ls -ld /opt/devops-handson"
```
