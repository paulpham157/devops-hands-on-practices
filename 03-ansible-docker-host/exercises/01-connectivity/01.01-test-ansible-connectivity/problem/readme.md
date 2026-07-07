# Test Ansible Connectivity

## Task

Start the Vagrant VM:

```bash
cd 00-docker-fundamentals/examples/lab-setup
vagrant up
cd ../../../03-ansible-docker-host
```

Run:

```bash
ansible -i inventory/hosts.ini docker_hosts -m ping
```

## Done When

The host returns `pong`.
