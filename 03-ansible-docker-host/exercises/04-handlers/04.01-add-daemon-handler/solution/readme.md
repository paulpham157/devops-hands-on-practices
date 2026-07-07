# Add Daemon Handler

Task example:

```yaml
- name: Configure Docker daemon
  ansible.builtin.copy:
    dest: /etc/docker/daemon.json
    content: |
      {"log-driver": "json-file"}
    mode: "0644"
  notify: Restart Docker
```

Handler example:

```yaml
handlers:
  - name: Restart Docker
    ansible.builtin.service:
      name: docker
      state: restarted
```
