# Add Daemon Handler

## Task

Add a task that writes `/etc/docker/daemon.json` with a simple JSON object. Notify a handler named `Restart Docker`.

Add the handler to restart the Docker service.

## Done When

The first run reports a changed config and handler execution. The next run does not restart Docker.
