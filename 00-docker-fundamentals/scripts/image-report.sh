#!/usr/bin/env sh
set -eu

images="
docker-course/nginx-basic:local
docker-course/python-flask:local
docker-course/node-single:local
docker-course/node-multistage:local
docker-course/node-distroless:local
"

printf '%-42s %12s\n' "IMAGE" "SIZE"
printf '%-42s %12s\n' "-----" "----"

for image in $images; do
  size=$(docker image inspect "$image" --format '{{.Size}}' 2>/dev/null || true)
  if [ -z "$size" ]; then
    printf '%-42s %12s\n' "$image" "not built"
  else
    mib=$(awk "BEGIN { printf \"%.1f MiB\", $size / 1024 / 1024 }")
    printf '%-42s %12s\n' "$image" "$mib"
  fi
done
