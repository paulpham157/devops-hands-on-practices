# Solution: Optimize Cache and Size

If only `app.py` changes, the Python Dockerfile should reuse the dependency install layer because `requirements.txt` is copied before `app.py`.

Dockerfiles that keep compilers out of the final image:

- Java Spring
- Go HTTP
- Rust HTTP

`pip install --no-cache-dir` avoids keeping pip's package cache in the image.

Go and Rust use distroless runtime images to keep the final image small and reduce unnecessary OS tools.

Before production deployment, run an image report and scan:

```bash
./scripts/image-report.sh
```

Then compare sizes and run a vulnerability scan with the scanner used by your platform.

