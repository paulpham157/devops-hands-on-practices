#!/usr/bin/env sh
set -eu

echo "==> K3s system pods"
kubectl get pods -n kube-system

echo
echo "==> Ingress classes"
kubectl get ingressclass

echo
echo "==> Storage classes"
kubectl get storageclass

echo
echo "==> Kube-system services"
kubectl get svc -n kube-system

echo
echo "==> AddOn resources"
kubectl get addon -n kube-system 2>/dev/null || echo "No AddOn resources visible with this kubectl context"
