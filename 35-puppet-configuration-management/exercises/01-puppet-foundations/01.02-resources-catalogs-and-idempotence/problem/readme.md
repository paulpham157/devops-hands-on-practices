# Resources, Catalogs, and Idempotence

Read `manifests/site.pp` and the two classes under `modules/`.

Then answer:

1. Which class expresses business intent for a Docker host?
2. Which resource in `profile::base` should become a no-op on the second run?
3. Which part of the catalog would fail first if the package name for Docker were wrong?
