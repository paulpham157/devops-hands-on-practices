# Solution: Build and Scan the Image

The default image tag is:

```text
docker-course-devsecops:local
```

`scan-image.sh` mounts:

```text
/var/run/docker.sock
```

The scanner needs Docker socket access to inspect the local image that was just built.

Image vulnerabilities are report-only by default because vulnerability databases change over time. A course lab should stay runnable while still showing the findings. Real teams can set `IMAGE_VULN_GATE=1` after agreeing on policy.
