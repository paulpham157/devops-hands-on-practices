# Lesson 18: Linux and Unix Fundamentals

## Goal

Learn the Linux and Unix fundamentals that appear every day in Docker, Kubernetes, CI/CD, servers, and troubleshooting.

This lesson teaches:

- What Unix, Linux, GNU/Linux, and POSIX mean
- Filesystem layout and navigation
- Files, directories, links, and streams
- Users, groups, ownership, and permissions
- Processes, exit codes, and signals
- Shell commands, pipes, redirects, and scripts
- Text processing with common Unix tools
- Basic network and port inspection
- How these concepts show up inside containers

## Navigation

- Previous lesson: `17-language-runtime-containerization`
- Next lesson: `19-redis-caching-load-balancing`

## Related Lessons

- `00-docker-fundamentals`
- `17-language-runtime-containerization`
- `20-application-protocols-microservices`

## Mental Model

```text
kernel -> system calls -> userland tools -> shell -> scripts and services
```

Linux is a kernel.

Unix is a family of operating systems and a design tradition.

POSIX is a standards family that defines portable operating system interfaces, including shell and utility behavior.

Most DevOps work happens in the userland layer: shell, files, processes, packages, logs, services, and networking tools.

## Lab Layout

```text
compose.yaml       Ubuntu and Alpine lab containers
sample-data/       log and CSV files for text processing
scripts/           start, shell, inspect, demo, and validation helpers
notes/             concept notes and command cheat sheet
exercises/         structured hands-on practice
sandbox/           generated practice files, ignored by git
```

## Components

| Container | Base Image | Shell | Purpose |
| --- | --- | --- | --- |
| `ubuntu-lab` | `ubuntu:24.04` | `bash` | Familiar Linux userland for general practice |
| `alpine-lab` | `alpine:3.20` | `sh` | Small container-style Linux userland using BusyBox |

Alpine is intentionally included because many container images are minimal. Some commands and flags available on Ubuntu may not exist in Alpine.

## Run

Start the lab containers:

```bash
cd 18-linux-unix-fundamentals
./scripts/start-lab.sh
```

Enter Ubuntu:

```bash
./scripts/shell-ubuntu.sh
```

Enter Alpine:

```bash
./scripts/shell-alpine.sh
```

Stop:

```bash
docker compose down
```

## Quick Practice Commands

Inside a lab container:

```bash
whoami
id
pwd
ls -la
uname -a
cat /etc/os-release
ps
echo "$PATH"
df -h
mount
```

Try filesystem navigation:

```bash
cd /tmp
mkdir -p practice/logs
touch practice/logs/app.log
ls -la practice
```

Try streams:

```bash
echo "hello linux" > /tmp/message.txt
cat /tmp/message.txt
cat /tmp/message.txt | tr a-z A-Z
```

## Core Concepts

| Concept | Meaning |
| --- | --- |
| Kernel | Core OS layer that manages processes, memory, devices, filesystems, and networking |
| Userland | Commands, shells, libraries, services, and tools above the kernel |
| Shell | Command interpreter such as `sh`, `bash`, or `zsh` |
| Process | Running program with a PID, environment, open files, and exit status |
| File descriptor | Integer handle for input/output, commonly `0` stdin, `1` stdout, `2` stderr |
| Permission | Read, write, execute bits for user, group, and others |
| Signal | Asynchronous process notification such as `TERM`, `INT`, or `KILL` |
| Pipeline | Connect stdout of one command to stdin of another command |

## Filesystem Basics

Common directories:

| Path | Purpose |
| --- | --- |
| `/` | filesystem root |
| `/bin`, `/usr/bin` | user commands |
| `/sbin`, `/usr/sbin` | system administration commands |
| `/etc` | system configuration |
| `/home` | regular user home directories |
| `/root` | root user home |
| `/tmp` | temporary files |
| `/var` | variable data such as logs, caches, spools |
| `/proc` | process and kernel information, virtual filesystem on Linux |
| `/dev` | device files |

Container images often include a smaller subset of these directories.

## Permissions Basics

Example:

```text
-rwxr-x--- 1 app app 120 script.sh
```

Read it as:

```text
file type | user permissions | group permissions | other permissions
```

Useful commands:

```bash
chmod +x script.sh
chmod 640 config.txt
chown app:app config.txt
id
umask
```

In containers, running as root is common in examples but should not be the production default.

## Processes and Signals

Useful commands:

```bash
ps
ps aux
top
kill -TERM <pid>
kill -KILL <pid>
echo $?
```

Signal guidance:

- `SIGTERM` asks a process to stop gracefully.
- `SIGINT` is commonly sent by Ctrl-C.
- `SIGKILL` cannot be handled and should be last resort.

Containers should handle `SIGTERM` cleanly so orchestrators can stop them without corrupting work.

## Text Pipelines

Unix tools are powerful because they compose through text streams.

Examples:

```bash
grep "ERROR" sample-data/app.log
awk '{print $1}' sample-data/app.log
sort sample-data/status-codes.txt | uniq -c
cat sample-data/app.log | grep checkout | wc -l
```

Prefer simple pipelines when they are readable. Use a proper language when parsing becomes complex or risky.

## Validate

```bash
./scripts/validate.sh
```

This checks:

- shell script syntax
- YAML syntax
- Docker Compose config when Docker is available
- sample data availability
- text pipeline demo output

## Production Notes

For real systems:

- Be careful with destructive commands such as `rm -rf`, `chmod -R`, and `chown -R`.
- Prefer least-privilege users for services.
- Make scripts fail early with `set -eu` when appropriate.
- Quote variables in shell scripts.
- Check exit codes.
- Write logs to stdout/stderr for containers.
- Know whether your image uses GNU tools, BusyBox tools, or BSD/macOS tools.
- Avoid relying on interactive shell behavior in automation.
- Use package managers only at build time unless runtime package installation is intentional.

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover Linux vs Unix, filesystem navigation, permissions, processes, text pipelines, shell script safety, network checks, and troubleshooting inside a container-like Linux environment.

## References

- The Open Group Base Specifications: https://pubs.opengroup.org/onlinepubs/9699919799/
- Linux kernel documentation: https://docs.kernel.org/
- Linux `/proc` filesystem documentation: https://docs.kernel.org/filesystems/proc.html
- Filesystem Hierarchy Standard: https://refspecs.linuxfoundation.org/fhs.shtml
- GNU Coreutils manual: https://www.gnu.org/software/coreutils/manual/
- Bash manual: https://www.gnu.org/software/bash/manual/

