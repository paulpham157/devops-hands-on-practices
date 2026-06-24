# Solution: Text Pipelines

Count errors:

```bash
grep -c "ERROR" sample-data/app.log
```

Count status `503`:

```bash
grep -c "status=503" sample-data/app.log
```

Show checkout lines:

```bash
grep "service=checkout" sample-data/app.log
```

Count total log lines:

```bash
wc -l sample-data/app.log
```

Summarize status codes:

```bash
sort sample-data/status-codes.txt | uniq -c
```

