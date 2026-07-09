#!/usr/bin/env python3
"""Extract explicit completion rules from a DOHP exercise."""

from __future__ import annotations

import argparse
import re
from pathlib import Path


COMPLETION_PATTERNS = (
    re.compile(r"^(Completion rule:.*)$", re.IGNORECASE | re.MULTILINE),
    re.compile(r"^(Completion target:.*)$", re.IGNORECASE | re.MULTILINE),
    re.compile(r"^(By the end,.*)$", re.IGNORECASE | re.MULTILINE),
)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("exercise", help="Path to an exercise folder or problem/readme.md.")
    args = parser.parse_args()

    path = Path(args.exercise)
    problem = path if path.is_file() else path / "problem" / "readme.md"
    if not problem.exists():
        parser.error(f"{problem} does not exist")

    text = problem.read_text(encoding="utf-8")
    matches: list[str] = []
    for pattern in COMPLETION_PATTERNS:
        matches.extend(match.group(1).strip() for match in pattern.finditer(text))

    if matches:
        for match in matches:
            print(match)
    else:
        print("No explicit completion rule found. Review against the task instructions and verification commands.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
