# Problem: Lint the Dockerfile

Run:

```bash
./scripts/lint-dockerfile.sh
```

Then inspect the Dockerfile:

```bash
sed -n '1,220p' sample-app/Dockerfile
```

Answer:

1. Which base image is used?
2. Which line changes the container away from root?
3. Why does this Dockerfile avoid installing extra Python packages?
4. Why is this check useful before building the image?
