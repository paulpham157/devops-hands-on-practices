# Problem: Troubleshoot a Container-like Linux System

Start the lab and enter Alpine:

```bash
./scripts/start-lab.sh
./scripts/shell-alpine.sh
```

Run:

```bash
whoami
pwd
cat /etc/os-release
which bash || true
which sh
ls -la
ps
echo $?
```

Answer:

1. Which shell is available?
2. Is Bash installed?
3. Which user are you?
4. What is the current working directory?
5. What would you check first if an app in this container failed to start?

