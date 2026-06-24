# Separate Core Domain from Infrastructure

| Concern | Best Location |
| --- | --- |
| Translate `txn_state` into `paymentStatus` | ACL Boundary |
| Forward logs to a collector | Sidecar or Helper |
| Apply payment business validation rules | Core Domain |
| Map old customer account codes into canonical IDs | ACL Boundary |

The domain should consume canonical concepts, not legacy contract details.

