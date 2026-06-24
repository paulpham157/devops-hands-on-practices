# Problem: Non-Root Containers

Build the Python Flask image:

```bash
docker build -t docker-course/python-flask:local examples/docker-image-examples/python-flask
```

Inspect the configured user:

```bash
docker image inspect docker-course/python-flask:local --format '{{.Config.User}}'
```

Run it:

```bash
docker run -d --name flask-demo -p 8000:8000 docker-course/python-flask:local
curl http://localhost:8000
docker logs flask-demo
docker rm -f flask-demo
```

Completion rule: the image has a non-empty configured user and the app still runs.
