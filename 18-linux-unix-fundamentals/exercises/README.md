# Exercises: Linux and Unix Fundamentals

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-foundations/01.01-linux-vs-unix-posix`
   - Explain Linux, Unix, GNU/Linux, and POSIX.

2. `01-foundations/01.02-filesystem-navigation`
   - Navigate the filesystem and identify common directories.

3. `02-users-permissions-processes/02.01-file-permissions`
   - Read and change permissions safely.

4. `02-users-permissions-processes/02.02-processes-and-signals`
   - Inspect processes, exit codes, and signals.

5. `03-shell-and-text/03.01-text-pipelines`
   - Use pipes, grep, awk, sort, uniq, and wc on sample logs.

6. `03-shell-and-text/03.02-shell-script-safety`
   - Understand quoting, `set -eu`, exit codes, and safe destructive commands.

7. `04-operations-troubleshooting/04.01-network-and-ports`
   - Inspect hostnames, interfaces, and listening ports.

8. `04-operations-troubleshooting/04.02-troubleshoot-a-container-like-linux-system`
   - Apply Linux basics to debug a minimal container environment.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
./scripts/permissions-demo.sh
./scripts/text-pipeline-demo.sh
./scripts/start-lab.sh
./scripts/shell-ubuntu.sh
docker compose down
```

Use the Alpine shell to see how minimal container images differ from Ubuntu.

