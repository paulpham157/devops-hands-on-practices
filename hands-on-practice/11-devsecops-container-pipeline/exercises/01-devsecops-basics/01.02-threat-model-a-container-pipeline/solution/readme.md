# Solution: Threat Model the Lab

Before build:

- A secret could be committed. `scan-secrets.sh` helps catch this.
- A dependency manifest could introduce a vulnerable package. `scan-filesystem.sh` helps catch this.

During build:

- The Dockerfile could run as root or use unsafe patterns. `lint-dockerfile.sh` helps catch this.
- The base image could include vulnerable packages. `scan-image.sh` helps catch this after build.

After build:

- The team might not know what is inside the image. `generate-sbom.sh` helps with inventory.
- CI might publish an image without a policy gate. `security-gate.sh` and the CI example help with that.

Scanning does not fully solve runtime authorization, network policy, incident response, or whether a vulnerability is exploitable in your exact environment.
