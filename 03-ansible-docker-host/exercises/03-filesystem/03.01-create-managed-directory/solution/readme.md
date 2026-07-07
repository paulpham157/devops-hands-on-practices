# Create Managed Directory

Add a task like:

```yaml
- name: Create course working directory
  ansible.builtin.file:
    path: /opt/devops-handson
    state: directory
    owner: root
    group: root
    mode: "0755"
```

Run the playbook twice. The second run should be idempotent.
