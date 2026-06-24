# Publish Build Info

1. `jf rt upload`.
2. `jf rt build-collect-env`.
3. `jf rt build-add-git`.
4. `jf rt build-publish`.
5. Build info connects the artifact to build number, source, environment, dependencies, and produced files. That makes promotion, audit, scanning, and rollback more reliable.

