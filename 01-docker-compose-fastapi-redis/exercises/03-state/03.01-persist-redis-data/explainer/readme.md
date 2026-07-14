# Persist Redis Data

Container filesystems are disposable. Redis stores data inside its container unless a volume is attached.

A named volume gives Redis a stable data directory managed by Docker. The container can be recreated while the volume remains.
