# Problem: Trace a Variable Through the Module

Trace `host_port` from input to output.

Read:

```bash
sed -n '1,200p' variables.tf
sed -n '1,200p' main.tf
sed -n '1,200p' modules/nginx_site/variables.tf
sed -n '1,200p' modules/nginx_site/main.tf
sed -n '1,200p' modules/nginx_site/outputs.tf
sed -n '1,200p' outputs.tf
```

Answer:

1. Where is the default `host_port` set?
2. How is it passed to the child module?
3. Where is it used by the Docker container?
4. Which output exposes the URL?
