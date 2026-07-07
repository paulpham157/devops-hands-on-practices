# Test Ansible Connectivity

Expected output shape:

```text
docker-vm | SUCCESS => {
    "ping": "pong"
}
```

If it fails, check:

- the VM is running,
- `ansible_host` is `192.168.201.10`,
- the private key path points to `00-docker-fundamentals/examples/lab-setup`.
