#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

"$ROOT_DIR/scripts/validate-curriculum.sh"

for script in "$ROOT_DIR"/[0-9][0-9]-*/scripts/validate.sh; do
  [ -f "$script" ] || continue
  lesson_dir=$(dirname -- "$(dirname -- "$script")")
  lesson_name=$(basename -- "$lesson_dir")
  echo "== $lesson_name"
  (cd "$lesson_dir" && ./scripts/validate.sh)
done

echo "All available lesson validation scripts passed."
