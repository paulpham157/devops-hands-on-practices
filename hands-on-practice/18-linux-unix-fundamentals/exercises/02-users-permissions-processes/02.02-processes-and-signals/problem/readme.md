# Problem: Processes and Signals

Inside the Ubuntu lab container, run:

```bash
sleep 300 &
ps
kill -TERM %1
echo $?
```

Then run:

```bash
false
echo $?
true
echo $?
```

Answer:

1. What PID did `sleep` get?
2. What does `kill -TERM` ask the process to do?
3. What exit code did `false` return?
4. What exit code did `true` return?
5. Why should `SIGKILL` be a last resort?

