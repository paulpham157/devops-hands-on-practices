# Deploy Through Traefik Ingress

Expected flow:

```bash
./scripts/deploy-app.sh
./scripts/test-app.sh
```

Expected output:

```text
Ingress test passed: http://localhost:8089/
```

The Ingress backend points to:

```text
service: k3s-demo
port: 80
```

The Service then targets the pod port named:

```text
http
```
