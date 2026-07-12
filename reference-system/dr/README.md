# Local Redis Backup and Restore Drill

This drill gives production-owner learners a concrete backup/restore loop without a cloud account. It is intentionally limited to the reference system's Redis volume; it does not prove regional recovery, encryption, access control, or production durability.

## Prerequisites

- Complete the reference-system smoke check.
- Keep the stack running while creating the backup.
- Do not store real data in this local lab.

## Drill

```sh
cd reference-system
./scripts/up.sh
./scripts/check.sh
./dr/scripts/backup-redis.sh
```

Record the timestamp and `completed_orders` value. Then make a deliberately disposable local change, for example enqueue another order using `./scripts/check.sh`.

Restore only when you understand that state written after the backup can be lost:

```sh
./dr/scripts/restore-redis.sh
./scripts/check.sh
```

## Required Decision Record

Use [rpo-rto-template.md](rpo-rto-template.md) to state:

- backup scope and consistency assumptions;
- proposed RPO and RTO;
- what data can be lost or replayed;
- who may initiate restore;
- how recovery is verified;
- what production controls are missing from this local exercise.

## Clean Up

```sh
./scripts/cleanup.sh
```

Backups are written under `dr/backups/` and are ignored by Git. Remove them when the drill is complete.
