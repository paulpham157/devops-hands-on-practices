# Split Playbook into Role

The top-level playbook should become small:

```yaml
- name: Configure Docker host
  hosts: docker_hosts
  become: true
  roles:
    - docker_host
```

Keep defaults in:

```text
roles/docker_host/defaults/main.yml
```

Then run:

```bash
ansible-playbook -i inventory/hosts.ini site.yml --syntax-check
ansible-playbook -i inventory/hosts.ini site.yml
```
