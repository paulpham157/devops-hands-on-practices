# Problem: Map the OpenTofu Concepts

From the lesson root, inspect these files:

```bash
sed -n '1,200p' versions.tf
sed -n '1,200p' main.tf
sed -n '1,200p' variables.tf
sed -n '1,200p' outputs.tf
sed -n '1,200p' modules/nginx_site/main.tf
```

Answer:

1. Which file declares the Docker provider requirement?
2. Which block configures the Docker provider?
3. Which file calls the child module?
4. Which resource pulls the Nginx image?
5. Which resource runs the Nginx container?
6. Which values can a user change without editing resource blocks?
