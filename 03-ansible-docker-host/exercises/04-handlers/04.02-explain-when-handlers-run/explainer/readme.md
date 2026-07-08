# Explain When Handlers Run

Handlers exist so expensive actions happen only when something relevant changed.

A normal task can notify a handler, but the handler runs later in the play rather than immediately after every task.

This keeps service restarts controlled and repeatable.
