# Explainer: Network and Ports

Linux systems expose network information through commands and virtual filesystems.

Common checks:

```bash
hostname
ip addr
ss -tulpen
curl -I http://example.com
```

Minimal images may not include these tools.

For containers, common questions are:

- Is the process listening?
- Which port is exposed?
- Is the service bound to `127.0.0.1` or `0.0.0.0`?
- Can another container reach it?
- Is DNS resolving?

