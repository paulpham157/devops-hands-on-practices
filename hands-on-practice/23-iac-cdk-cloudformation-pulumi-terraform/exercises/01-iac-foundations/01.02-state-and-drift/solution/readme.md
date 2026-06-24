# State and Drift

| Situation | Classification | Response |
| --- | --- | --- |
| An engineer manually enables public access on a bucket | Drift risk | detect drift, revert through IaC, restrict manual access |
| Terraform local state is deleted from a laptop | State risk | use remote state with locking and backups |
| A resource exists in AWS but is not in IaC | Both | import it or recreate it through IaC after review |
| A CI job applies a stale plan after another merge | Both | regenerate plan in CI and lock state during apply |

A strong production rule: all applies run through CI/CD with remote locked state and a fresh plan or preview.

