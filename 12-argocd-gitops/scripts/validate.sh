#!/usr/bin/env sh
set -eu

required_files="
README.md
argocd/applications/course-web.yaml.tpl
scripts/render-application.sh
scripts/apply-application.sh
scripts/validate-manifests.sh
exercises/README.md
"

for file in $required_files; do
  test -f "$file"
  echo "ok $file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 8 ]
  echo "ok exercises $variant readmes: $count"
done

find scripts -name '*.sh' ! -name validate.sh -exec sh -n {} \;
echo "ok shell scripts"

REPO_URL=https://github.com/example-org/devops-hands-on-practices.git ./scripts/render-application.sh >/dev/null
echo "ok rendered Argo CD application"

echo "Validation passed"
