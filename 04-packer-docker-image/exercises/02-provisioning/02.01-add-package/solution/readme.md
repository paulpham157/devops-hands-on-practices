# Add Package

The package install command should include `curl`.

After building, verify from the image:

```bash
docker run --rm docker-course/packer-nginx:1.0 curl --version
```

Then ask whether the package belongs in the final runtime image or only in a build/debug image.
