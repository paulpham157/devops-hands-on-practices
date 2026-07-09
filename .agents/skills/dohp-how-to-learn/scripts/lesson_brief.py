#!/usr/bin/env python3
"""Print a short learner-facing brief for one DOHP lesson folder."""

from __future__ import annotations

import argparse
import re
from pathlib import Path


def first_paragraph(markdown: str) -> str:
    lines: list[str] = []
    for line in markdown.splitlines()[1:]:
        stripped = line.strip()
        if not stripped and lines:
            break
        if stripped and not stripped.startswith("#"):
            lines.append(stripped)
    return " ".join(lines)


def exercise_count(exercises_readme: Path) -> int:
    if not exercises_readme.exists():
        return 0
    return len(re.findall(r"^\d+\.\s+`", exercises_readme.read_text(encoding="utf-8"), re.MULTILINE))


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("lesson", help="Path to a numbered lesson folder.")
    args = parser.parse_args()

    lesson = Path(args.lesson)
    readme = lesson / "README.md"
    if not readme.exists():
        parser.error(f"{readme} does not exist")

    title = readme.read_text(encoding="utf-8").splitlines()[0].lstrip("# ").strip()
    intro = first_paragraph(readme.read_text(encoding="utf-8"))
    validate = lesson / "scripts" / "validate.sh"
    exercises = lesson / "exercises" / "README.md"

    print(f"Lesson: {title}")
    if intro:
        print(f"Goal: {intro}")
    print(f"Validation: {'./scripts/validate.sh' if validate.exists() else 'No lesson validate.sh found'}")
    print(f"Exercise count: {exercise_count(exercises)}")
    print("Suggested first move: read README.md, run validation if available, then open exercises/README.md.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
