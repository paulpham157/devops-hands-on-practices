# Plan Remote State and Locking

Shared state should live in a remote backend with access control, versioning, and locking support.

Locking prevents simultaneous mutation against the same state snapshot. Code review is still required because a well-locked bad change is still a bad change.

The local habits still matter: run format and validation, read the plan, and treat state as sensitive operational data.
