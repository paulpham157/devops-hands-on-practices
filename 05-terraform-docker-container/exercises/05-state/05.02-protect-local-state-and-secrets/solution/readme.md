# Protect Local State and Secrets

Local state, plan files, and provider caches should stay out of Git.

State can contain identifiers, computed values, and sometimes secrets or connection details.

Remote state adds shared access, locking, backup, and access control concerns on top of the same sensitivity.
