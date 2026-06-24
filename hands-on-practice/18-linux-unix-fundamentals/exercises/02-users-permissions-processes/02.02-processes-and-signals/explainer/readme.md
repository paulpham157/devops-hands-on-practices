# Explainer: Processes and Signals

A process is a running program.

Important process facts:

- every process has a PID.
- every process has an exit code.
- processes can receive signals.
- processes inherit environment variables.
- processes can open files and network sockets.

Common signals:

- `SIGTERM`: request graceful stop
- `SIGINT`: interrupt, often Ctrl-C
- `SIGKILL`: force stop, cannot be handled

Containers need correct signal handling because orchestrators stop containers by sending termination signals.

