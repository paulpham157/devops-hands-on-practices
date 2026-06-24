# Solution: Read a Helm Chart

The chart creates:

- ServiceAccount
- ConfigMap
- Deployment
- Service
- optional Ingress
- test Pod for `helm test`

The image is controlled by:

```text
image.repository
image.tag
image.pullPolicy
```

Dev and prod values differ in environment name, replica count, image tag, resources, and ingress settings.

`values.schema.json` catches invalid values before rendering or installing. For example, it can reject a replica count below 1 or missing image repository.

`_helpers.tpl` centralizes names, labels, and selector labels. This keeps templates consistent and avoids copy-paste label drift.

