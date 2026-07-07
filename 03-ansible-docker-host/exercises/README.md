# Exercises: Configure a Docker Host with Ansible

## Sections

1. `01-connectivity`
   - Verify inventory, SSH, and Python access.
2. `02-idempotence`
   - Add package management and compare check mode with apply.
3. `03-filesystem`
   - Create managed host directories.
4. `04-handlers`
   - Add a Docker daemon change with a restart handler.
5. `05-roles`
   - Split the playbook into a reusable role.

## Suggested Flow

Start from connection proof, then make one host change at a time.

```text
ping -> check mode -> apply -> verify -> refactor into role
```

## Completion Target

By the end, you should be able to explain:

- How inventory variables connect to the Vagrant VM.
- Why Ansible tasks should be idempotent.
- How handlers avoid unnecessary service restarts.
- Why roles are the usual structure for reusable automation.
