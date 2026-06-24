#!/usr/bin/env sh
set -eu

command -v kubectl >/dev/null 2>&1 || {
  echo "kubectl is required" >&2
  exit 1
}

kubectl scale deployment/course-web -n docker-course-gitops --replicas=1
kubectl get deployment course-web -n docker-course-gitops -o jsonpath='{.spec.replicas}{"\n"}'
echo "Argo CD self-heal should restore replicas to the Git-declared value: 2"
