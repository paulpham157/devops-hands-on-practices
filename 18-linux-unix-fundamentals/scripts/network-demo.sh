#!/usr/bin/env sh
set -eu

echo "Hostname:"
hostname

echo
echo "Network interfaces:"
if command -v ip >/dev/null 2>&1; then
  ip addr
elif command -v ifconfig >/dev/null 2>&1; then
  ifconfig
else
  echo "No ip or ifconfig command found in this environment"
fi

echo
echo "Listening ports:"
if command -v ss >/dev/null 2>&1; then
  ss -tulpen
elif command -v netstat >/dev/null 2>&1; then
  netstat -tulpen
else
  echo "No ss or netstat command found in this environment"
fi

