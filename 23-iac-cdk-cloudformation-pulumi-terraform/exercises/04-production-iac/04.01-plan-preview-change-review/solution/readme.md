# Plan, Preview, and Change Review

| Proposed Change | Decision | Reason |
| --- | --- | --- |
| Add tags to an existing bucket | Usually approve | Low risk if no replacement occurs |
| Replace a database instance | Escalate | Data loss and downtime risk |
| Add `s3:*` to an application role | Escalate | Broad IAM permission expansion |
| Enable bucket encryption | Usually approve | Security improvement, but verify compatibility |
| Destroy an unused test queue | Approve after owner check | Deletion is acceptable only when ownership and usage are confirmed |

Any replacement, deletion, or broad IAM expansion deserves extra review.

