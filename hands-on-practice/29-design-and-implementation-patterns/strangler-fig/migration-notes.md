# Strangler Fig Migration Notes

The key idea is not "rewrite in parallel." The key idea is "replace behavior slice by slice behind a stable entry point."

Typical steps:

- place routing or facade layer in front of the legacy system
- move one capability at a time to new services
- monitor traffic and rollback per capability
- retire legacy paths only after the new path is proven
