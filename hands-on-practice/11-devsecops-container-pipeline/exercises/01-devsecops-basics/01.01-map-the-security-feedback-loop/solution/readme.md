# Solution: Map the Security Feedback Loop

One reasonable mapping:

| Stage | Script | Risk it catches | Should it block a PR? |
| --- | --- | --- | --- |
| Before build | `lint-dockerfile.sh` | Unsafe or inconsistent Dockerfile patterns | Yes |
| Before build | `scan-secrets.sh` | Committed credentials | Yes |
| Before build | `scan-filesystem.sh` | Vulnerable dependencies, config issues, secrets | Usually yes for critical findings |
| After build | `scan-image.sh` | Vulnerable runtime packages in final image | Start report-only, then enforce critical findings |
| After build | `generate-sbom.sh` | Missing dependency inventory | Yes for release builds |

Secret scanning should block early because a leaked credential can be abused quickly and may require key rotation, not just a code fix.
