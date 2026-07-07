# Ansible Docker Host Exercises

These exercises extend lesson 03. Start the Vagrant VM from the Docker fundamentals lab first:

```bash
cd 00-docker-fundamentals/examples/lab-setup
vagrant up
cd ../../../03-ansible-docker-host
```

## Exercise Order

1. Run `ansible -i inventory/hosts.ini docker_hosts -m ping` and confirm SSH connectivity.
2. Add one package to `docker_host_packages`, run in check mode, then apply.
3. Add a task that creates `/opt/devops-handson` with root ownership.
4. Add a Docker daemon config task and notify a handler that restarts Docker.
5. Split the playbook into a role named `docker_host`.

## Completion Rule

Finish each exercise only after Ansible reports the expected change:

```text
edit playbook -> ansible-playbook --check -> ansible-playbook -> verify with ad hoc command
```
