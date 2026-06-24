# Explainer: Text Pipelines

Unix tools compose through streams.

Common pattern:

```text
command | filter | transform | summarize
```

Examples:

```bash
grep ERROR sample-data/app.log
awk '{print $1}' sample-data/app.log
sort sample-data/status-codes.txt | uniq -c
wc -l sample-data/app.log
```

This is useful for logs, config files, CSV-like data, and quick operational checks.

