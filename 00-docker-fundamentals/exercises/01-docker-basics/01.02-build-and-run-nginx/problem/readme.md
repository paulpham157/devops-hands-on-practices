# Problem: Build and Run NGINX

From `00-docker-fundamentals`, build the image:

```bash
docker build -t docker-course/nginx-basic:local examples/docker-image-examples/nginx
```

Run it:

```bash
docker run --rm --name nginx-basic -p 8080:80 docker-course/nginx-basic:local
```

In another terminal, verify:

```bash
curl -i http://localhost:8080
docker container ls
docker image ls docker-course/nginx-basic
```

Stop the foreground container with `Ctrl+C`.

Completion rule: you can explain which port belongs to the host and which port belongs to the container.
