# Solution: Build and Run NGINX

The build should create:

```text
docker-course/nginx-basic:local
```

The run command publishes:

```text
host port 8080 -> container port 80
```

Expected `curl` result:

```text
HTTP/1.1 200 OK
```

If port `8080` is already used, choose another host port:

```bash
docker run --rm --name nginx-basic -p 8081:80 docker-course/nginx-basic:local
curl -i http://localhost:8081
```
