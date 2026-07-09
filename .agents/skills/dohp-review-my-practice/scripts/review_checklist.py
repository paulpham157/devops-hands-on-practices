#!/usr/bin/env python3
"""Print a deterministic DOHP practice review checklist."""

from __future__ import annotations

import argparse
from pathlib import Path


def target_type(path: Path) -> str:
    if (path / "problem" / "readme.md").exists():
        return "exercise"
    if (path / "README.md").exists():
        return "lesson"
    return "unknown"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("target", help="Lesson folder or exercise folder.")
    args = parser.parse_args()

    target = Path(args.target)
    kind = target_type(target)
    if kind == "unknown":
        parser.error("target must be a lesson folder or an exercise folder")

    print(f"Review target: {target}")
    print(f"Target type: {kind}")
    print("Checklist:")
    print("- Does the attempt satisfy the explicit task?")
    print("- Is there command output, file content, or validation evidence?")
    print("- Can the learner explain the main concept in plain language?")
    print("- Are there missing cleanup, safety, or verification steps?")
    print("- Is any production tradeoff relevant to mention separately from the lesson pass criteria?")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
