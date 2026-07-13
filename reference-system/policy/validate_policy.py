#!/usr/bin/env python3
"""Validate the small provider-neutral reference-system policy."""

from __future__ import annotations

import json
import sys
from pathlib import Path


def main() -> int:
    if len(sys.argv) != 2:
        print(f"usage: {sys.argv[0]} INPUT.json", file=sys.stderr)
        return 2

    path = Path(sys.argv[1])
    try:
        document = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as error:
        print(f"cannot read policy input: {error}", file=sys.stderr)
        return 2

    runtime = document.get("runtime", {})
    violations: list[str] = []
    if not document.get("owner"):
        violations.append("service owner is required")
    if not document.get("slo_ref"):
        violations.append("slo_ref is required")
    if document.get("budget_monthly_usd", 0) > 1500:
        violations.append("monthly budget exceeds 1500 USD cap")
    if runtime.get("run_as_non_root") is not True:
        violations.append("runtime must declare run_as_non_root=true")
    if runtime.get("network_policy") is not True:
        violations.append("runtime must declare network_policy=true")
    if str(runtime.get("image", "")).endswith(":latest"):
        violations.append("mutable :latest image tags are forbidden")

    if violations:
        print("Policy denied:")
        for violation in violations:
            print(f"- {violation}")
        return 1

    print(f"Policy passed for {document.get('service', 'unnamed-service')}.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
