# Read Inventory and Gather Facts

## Task

Read `inventory/hosts.ini`, then gather a few facts:

```bash
ansible -i inventory/hosts.ini docker_hosts -m setup -a 'filter=ansible_*_python*'
ansible -i inventory/hosts.ini docker_hosts -m setup -a 'filter=ansible_distribution*'
```

Answer:

1. Which host group is targeted by this lesson?
2. Which host or IP is defined?
3. Why do gathered facts matter before package installation tasks?

## Done When

You can explain the difference between inventory data and gathered facts.
