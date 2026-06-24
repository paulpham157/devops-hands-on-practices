# Problem: Change the Host Port

Create a plan with a different port:

```bash
tofu plan -var='host_port=8097'
```

Then try an invalid port:

```bash
tofu plan -var='host_port=80'
```

Answer:

1. What URL would port `8097` produce?
2. Does OpenTofu allow port `80`?
3. Which validation block rejects the invalid port?
4. Why is this safer than editing the resource block directly?
