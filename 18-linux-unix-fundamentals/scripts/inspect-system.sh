#!/usr/bin/env sh
set -eu

echo "== identity =="
whoami
id

echo
echo "== system =="
uname -a
if [ -f /etc/os-release ]; then
  sed -n '1,8p' /etc/os-release
fi

echo
echo "== shell =="
printf 'SHELL=%s\n' "${SHELL:-unknown}"
printf 'PATH=%s\n' "$PATH"

echo
echo "== filesystem =="
pwd
ls -la | sed -n '1,12p'
df -h . 2>/dev/null || true

echo
echo "== processes =="
ps 2>/dev/null | sed -n '1,12p' || true

