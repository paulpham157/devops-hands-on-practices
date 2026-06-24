# Solution: Compare Repository Modes

Classification:

| Repository | Mode |
| --- | --- |
| `docker-hosted` | hosted |
| `dockerhub-proxy` | proxy |
| `docker-group` | group |
| `helm-local` | local |
| `helm-remote` | remote |
| `helm-virtual` | virtual |
| `maven-releases` | hosted/local |
| `npmjs-remote` | proxy/remote |

CI should publish internal artifacts to hosted or local repositories.

Developer laptops should usually consume from group or virtual repositories.

Proxy or remote repositories protect teams from repeated public internet downloads and upstream outages.

Production deployments should avoid mutable tags because the same deployment reference could point to different content over time.

