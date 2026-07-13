#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
CURRICULUM_DIR="$ROOT_DIR/docs/curriculum"

required_files="
README.md
competency-matrix.md
lesson-inventory.md
lesson-metadata.tsv
legacy-migration.md
workstream-register.md
templates/lesson-contract.md
templates/exercise-contract.md
templates/assessment-rubric.md
capstone/README.md
capstone/system-brief.md
capstone/required-artifacts.md
capstone/rubric.md
capstone/design-defense.md
capstone/pilot-calibration.md
assessments/README.md
assessments/level-exit-rubrics.md
personas.md
"

for file in $required_files; do
  if [ ! -f "$CURRICULUM_DIR/$file" ]; then
    echo "Missing curriculum artifact: docs/curriculum/$file" >&2
    exit 1
  fi
done

if [ ! -f "$ROOT_DIR/docs/adr/0002-curriculum-redesign-architecture.md" ]; then
  echo "Missing curriculum redesign ADR: docs/adr/0002-curriculum-redesign-architecture.md" >&2
  exit 1
fi

for heading in "## Proficiency Levels" "## Shared Production-Ownership Core" "## Required Behavior and Dependencies by Competency"; do
  if ! grep -q "$heading" "$CURRICULUM_DIR/competency-matrix.md"; then
    echo "Competency matrix is missing required section: $heading" >&2
    exit 1
  fi
done

if ! grep -q '^| Workstream | Accountable owner | Depends on | Rough size | Deliverable | Acceptance check |' "$CURRICULUM_DIR/workstream-register.md"; then
  echo "Workstream register does not have the required accountability columns." >&2
  exit 1
fi

for heading in "## Path Dependencies and Crossovers" "## Level 1: Foundations" "## Level 2: Delivery Practitioner Shared Core" "## Level 3: Production-Owner Preparation" "## Specialization Overlays" "## Goal-Oriented Routes" "## Resume From Existing Progress"; do
  if ! grep -q "$heading" "$ROOT_DIR/LEARNING_PATHS.md"; then
    echo "Learning Paths is missing required section: $heading" >&2
    exit 1
  fi
done


lesson_count=$(find "$ROOT_DIR" -maxdepth 1 -type d -name '[0-9][0-9]-*' | wc -l | tr -d ' ')
inventory_count=$(awk '/^\| [0-9][0-9] \|/ { count += 1 } END { print count + 0 }' "$CURRICULUM_DIR/lesson-inventory.md")
metadata_count=$(awk -F '\t' 'NR > 1 && $1 != "" { count += 1 } END { print count + 0 }' "$CURRICULUM_DIR/lesson-metadata.tsv")

if [ "$lesson_count" -ne "$inventory_count" ]; then
  echo "Lesson inventory has $inventory_count rows, but repository has $lesson_count numbered lessons." >&2
  exit 1
fi

if [ "$lesson_count" -ne "$metadata_count" ]; then
  echo "Lesson metadata has $metadata_count rows, but repository has $lesson_count numbered lessons." >&2
  exit 1
fi

metadata_header=$(head -n 1 "$CURRICULUM_DIR/lesson-metadata.tsv")
expected_metadata_header=$(printf 'lesson\towner\tlevel\tcompetencies\tevidence')
if [ "$metadata_header" != "$expected_metadata_header" ]; then
  echo "Lesson metadata header is invalid." >&2
  exit 1
fi

if awk -F '\t' 'NR > 1 && ($1 == "" || $2 == "" || $3 == "" || $4 == "" || $5 == "") { bad = 1 } END { exit bad }' "$CURRICULUM_DIR/lesson-metadata.tsv"; then
  :
else
  echo "Lesson metadata contains an empty required field." >&2
  exit 1
fi

if awk -F '\t' 'NR > 1 && $2 != "curriculum-maintainers" { bad = 1 } END { exit bad }' "$CURRICULUM_DIR/lesson-metadata.tsv"; then
  :
else
  echo "Lesson metadata contains an unknown owner." >&2
  exit 1
fi

if awk -F '\t' 'NR > 1 && $3 !~ /^(foundation|practitioner|production-owner|specialization)$/ { bad = 1 } END { exit bad }' "$CURRICULUM_DIR/lesson-metadata.tsv"; then
  :
else
  echo "Lesson metadata contains an invalid level." >&2
  exit 1
fi

if awk -F '\t' 'NR > 1 { n = split($4, codes, ","); for (i = 1; i <= n; i++) if (codes[i] !~ /^(SYS|NET|K8S|IAC|DEL|CLD|SEC|OBS|REL|DR|PERF|FIN|PLAT|ADR|LEAD)$/) bad = 1 } END { exit bad }' "$CURRICULUM_DIR/lesson-metadata.tsv"; then
  :
else
  echo "Lesson metadata contains an unknown competency code." >&2
  exit 1
fi

for lesson_dir in "$ROOT_DIR"/[0-9][0-9]-*; do
  lesson=$(basename "$lesson_dir" | cut -d- -f1)
  if ! grep -q "^| $lesson |" "$CURRICULUM_DIR/lesson-inventory.md"; then
    echo "Lesson $lesson is missing from docs/curriculum/lesson-inventory.md" >&2
    exit 1
  fi
  if ! awk -F '\t' -v lesson="$(basename "$lesson_dir")" 'NR > 1 && $1 == lesson { found = 1 } END { exit !found }' "$CURRICULUM_DIR/lesson-metadata.tsv"; then
    echo "Lesson $lesson is missing from docs/curriculum/lesson-metadata.tsv" >&2
    exit 1
  fi
  if [ ! -d "$lesson_dir/exercises" ] || [ ! -f "$lesson_dir/scripts/validate.sh" ]; then
    echo "Lesson $lesson is missing the standard exercises or validator path." >&2
    exit 1
  fi
  explainer_count=$(find "$lesson_dir/exercises" -path '*/explainer/readme.md' -type f | wc -l | tr -d ' ')
  problem_count=$(find "$lesson_dir/exercises" -path '*/problem/readme.md' -type f | wc -l | tr -d ' ')
  solution_count=$(find "$lesson_dir/exercises" -path '*/solution/readme.md' -type f | wc -l | tr -d ' ')
  if [ "$explainer_count" -ne "$problem_count" ] || [ "$problem_count" -ne "$solution_count" ]; then
    echo "Lesson $lesson has unpaired explainer/problem/solution exercise files." >&2
    exit 1
  fi

  lesson_readme="$lesson_dir/README.md"
  if ! grep -q '^## Prerequisites and Entry Check' "$lesson_readme"; then
    echo "Lesson $lesson is missing the standard prerequisites/entry-check section." >&2
    exit 1
  fi
  if ! grep -Eq '^## Cleanup$|^## Clean Up$' "$lesson_readme"; then
    echo "Lesson $lesson is missing a cleanup section." >&2
    exit 1
  fi
done

echo "Curriculum architecture artifacts are complete for $lesson_count numbered lessons."
