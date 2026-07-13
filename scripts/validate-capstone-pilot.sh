#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
CALIBRATION="$ROOT_DIR/docs/curriculum/capstone/pilot-calibration.md"

pilot_count=$(awk -F '|' '/^\| [^_].*\|/ && $0 !~ /Pilot ID/ && $0 !~ /---/ { count += 1 } END { print count + 0 }' "$CALIBRATION")

if [ "$pilot_count" -lt 3 ]; then
  echo "Capstone pilot gate is pending: found $pilot_count calibration record(s), need at least 3." >&2
  exit 1
fi

echo "Capstone pilot gate passed with $pilot_count calibration records."
