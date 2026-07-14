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
        "Level 1: Foundations",
        ("new", "beginner", "foundation", "basic", "start", "linux", "terminal"),
        ("18-linux-unix-fundamentals", "00-docker-fundamentals", "01-docker-compose-fastapi-redis"),
        "Build safe Linux, container, and local workflow confidence before choosing an overlay.",
    ),
    LearningPath(
        "Level 2: Delivery Practitioner Shared Core",
        ("job", "junior", "interview", "intern", "career", "practical", "devops"),
        ("03-ansible-docker-host", "05-terraform-docker-container", "08-github-actions-gitlab-ci"),
        "Build repeatable infrastructure, delivery, deployment, and observability evidence.",
    ),
    LearningPath(
        "Level 3: Production-Owner Preparation",
        ("production", "incident", "on-call", "reliability", "slo", "availability", "operate"),
        ("19-redis-caching-load-balancing", "27-data-management", "28-availability-patterns"),
        "Connect delivery work to failure, recovery, service objectives, and tradeoff decisions.",
    ),
    LearningPath(
        "CI/CD and Release Engineering Overlay",
        ("ci", "cd", "pipeline", "release", "jenkins", "github", "gitlab", "artifact"),
        ("04-packer-docker-image", "07-jenkins-ci-pipeline", "24-jfrog-artifactory"),
        "Add promotion, artifact, and rollback reasoning after the shared delivery core.",
    ),
    LearningPath(
        "Infrastructure as Code and Automation Overlay",
        ("iac", "terraform", "opentofu", "ansible", "packer", "automation", "provision"),
        ("03-ansible-docker-host", "04-packer-docker-image", "05-terraform-docker-container"),
        "Add infrastructure and configuration-management depth after the shared delivery core.",
    ),
    LearningPath(
        "Platform Engineering and SRE Overlay",
        ("sre", "reliability", "observability", "slo", "platform", "gitops", "operate"),
        ("02-kubernetes-nginx", "06-observability-prometheus-grafana-loki", "09-k3s-local-cluster"),
        "Add platform operations and reliability depth after the shared delivery core.",
    ),
    LearningPath(
        "DevSecOps Overlay",
        ("security", "devsecops", "supply", "sbom", "secret", "identity", "compliance"),
        ("11-devsecops-container-pipeline", "13-vaults-and-secrets-managers", "14-aws-identity"),
        "Add security, identity, and supply-chain evidence after the shared delivery core.",
    ),
    LearningPath(
        "Cloud Architecture Overlay",
        ("cloud", "aws", "azure", "gcp", "serverless", "architecture", "landing"),
        ("21-aws-azure-gcp-cloud-fundamentals", "22-serverless-functions-platforms", "23-iac-cdk-cloudformation-pulumi-terraform"),
        "Add cloud-platform and architecture tradeoff evidence after the shared delivery core.",
    ),
    LearningPath(
        "Distributed Application Architecture Overlay",
        ("distributed", "microservice", "protocol", "redis", "network", "bff", "data"),
        ("19-redis-caching-load-balancing", "20-application-protocols-microservices", "27-data-management"),
        "Add data, protocol, and application-architecture tradeoff evidence after the shared delivery core.",
    ),
    LearningPath(
        "Data Reliability Overlay",
        ("data", "pipeline", "etl", "streaming", "recovery", "backup", "restore"),
        ("27-data-management", "28-availability-patterns", "32-sla-sli-slo"),
        "Add data-quality, reliability, and recovery reasoning after the shared delivery core.",
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
    beginner_words = {"new", "beginner", "foundation", "basic", "start", "linux", "terminal"}
    if words & beginner_words:
        ranked = [PATHS[0]]
    else:
        ranked = sorted(PATHS, key=lambda path: score_path(path, words), reverse=True)
    chosen = [path for path in ranked if score_path(path, words) > 0] or ranked[:1]

    for index, path in enumerate(chosen[: args.limit], start=1):
        print(f"{index}. {path.name}")
        print(f"   Outcome: {path.outcome}")
        if path.name != "Level 1: Foundations":
            print("   Before this: verify the required level evidence in LEARNING_PATHS.md; an overlay does not bypass the shared core.")
        print(f"   Start with: {', '.join(path.lessons)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
