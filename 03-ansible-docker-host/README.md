# Lesson 03: Configure a Docker Host with Ansible

## Goal

Use Ansible to configure the Vagrant Ubuntu VM from `../00-docker-fundamentals/examples/lab-setup` as a Docker host.

The default inventory targets the VM from `../00-docker-fundamentals/examples/lab-setup/settings.yaml`:

```text
192.168.201.10
```

## Navigation

- Previous lesson: `02-kubernetes-nginx`
- Next lesson: `04-packer-docker-image`

## Related Lessons

- `04-packer-docker-image`
- `35-puppet-configuration-management`
- `36-chef-infra-automation`

## Start the VM

```bash
cd ../00-docker-fundamentals/examples/lab-setup
vagrant up
```

Return to this lesson:

```bash
cd ../../../03-ansible-docker-host
```

## Check Connectivity

```bash
ansible -i inventory/hosts.ini docker_hosts -m ping
```

## Dry Run

```bash
ansible-playbook -i inventory/hosts.ini site.yml --check
```

## Apply

```bash
ansible-playbook -i inventory/hosts.ini site.yml
```

## Verify

```bash
ansible -i inventory/hosts.ini docker_hosts -m command -a "docker --version"
ansible -i inventory/hosts.ini docker_hosts -m command -a "docker run --rm hello-world"
```

## Practice Tasks

1. Add another package to `docker_host_packages`.
2. Change the Docker service state to stopped, run the playbook, then revert it.
3. Add a task that creates `/opt/docker-course`.
4. Add a handler that restarts Docker when daemon config changes.
5. Split the playbook into a role named `docker_host`.

## Clean Up

The playbook installs packages on the VM. To remove the whole VM:

```bash
cd ../00-docker-fundamentals/examples/lab-setup
vagrant destroy -f
```
