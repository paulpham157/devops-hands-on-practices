#!/usr/bin/env sh
set -eu

required_files="
README.md
inventory/hosts.ini
site.yml
exercises/README.md
"

for file in $required_files; do
  test -f "$file"
  echo "ok $file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 5 ]
  echo "ok exercises $variant readmes: $count"
done

if grep -R "../00-docker-fundamentals/lab-setup" README.md inventory >/dev/null 2>&1; then
  echo "stale lab-setup path found" >&2
  exit 1
fi

if command -v ansible-playbook >/dev/null 2>&1; then
  ansible-playbook -i inventory/hosts.ini site.yml --syntax-check >/dev/null
  echo "ok site.yml"
else
  echo "ansible-playbook not available; skipping Ansible syntax check"
fi

echo "Validation passed"
