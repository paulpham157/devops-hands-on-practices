# Add Daemon Handler

Handlers run only when notified by changed tasks.

This is useful for service restarts. A config file change should restart Docker, but a no-op playbook run should not.
