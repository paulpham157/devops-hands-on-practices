# Explain When Handlers Run

The task that changes Docker daemon configuration should notify the restart handler.

The handler runs later in the play after normal tasks finish, and only if at least one notifying task reported `changed`.

That prevents unnecessary restarts and makes the playbook safer to rerun.
