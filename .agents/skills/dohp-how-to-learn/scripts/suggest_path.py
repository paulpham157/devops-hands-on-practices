#!/usr/bin/env python3
"""Suggest a DOHP learning path from a learner goal."""

from __future__ import annotations

import argparse
from dataclasses import dataclass


@dataclass(frozen=True)
class LearningPath:
    name: str
    keywords: tuple[str, ...]
    lessons: tuple[str, ...]
    outcome: str


PATHS = (
    LearningPath(
        "New To DevOps",
        ("new", "beginner", "foundation", "basic", "start", "linux", "terminal"),
        ("18-linux-unix-fundamentals", "00-docker-fundamentals", "01-docker-compose-flask-redis"),
        "Build basic Linux, container, and local workflow confidence.",
    ),
    LearningPath(
        "Job-Ready Junior DevOps",
        ("job", "junior", "interview", "intern", "career", "practical", "devops"),
        ("00-docker-fundamentals", "01-docker-compose-flask-redis", "02-kubernetes-nginx"),
        "Practice the core tools expected in an entry-level DevOps flow.",
    ),
    LearningPath(
        "Docker And Kubernetes First",
        ("docker", "container", "kubernetes", "k8s", "helm", "platform"),
        ("00-docker-fundamentals", "01-docker-compose-flask-redis", "17-language-runtime-containerization"),
        "Build container fluency before moving into orchestration and packaging.",
    ),
    LearningPath(
        "CI/CD And Release Engineering",
        ("ci", "cd", "pipeline", "release", "jenkins", "github", "gitlab", "artifact"),
        ("00-docker-fundamentals", "04-packer-docker-image", "07-jenkins-ci-pipeline"),
        "Learn how teams validate, package, secure, and promote changes.",
    ),
    LearningPath(
        "Infrastructure As Code And Automation",
        ("iac", "terraform", "opentofu", "ansible", "packer", "automation", "provision"),
        ("03-ansible-docker-host", "04-packer-docker-image", "05-terraform-docker-container"),
        "Build repeatable infrastructure and configuration management judgment.",
    ),
    LearningPath(
        "Platform Engineering And SRE",
        ("sre", "reliability", "observability", "slo", "platform", "gitops", "operate"),
        ("02-kubernetes-nginx", "06-observability-prometheus-grafana-loki", "09-k3s-local-cluster"),
        "Connect platform operations, observability, and reliability thinking.",
    ),
)


def score_path(path: LearningPath, words: set[str]) -> int:
    return sum(1 for keyword in path.keywords if keyword in words)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--goal", required=True, help="Learner goal or background.")
    parser.add_argument("--limit", type=int, default=3, help="Number of path suggestions to print.")
    args = parser.parse_args()

    words = {word.strip(".,:;!?()[]{}").lower() for word in args.goal.split()}
    ranked = sorted(PATHS, key=lambda path: score_path(path, words), reverse=True)
    chosen = [path for path in ranked if score_path(path, words) > 0] or ranked[:1]

    for index, path in enumerate(chosen[: args.limit], start=1):
        print(f"{index}. {path.name}")
        print(f"   Outcome: {path.outcome}")
        print(f"   Start with: {', '.join(path.lessons)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
