# Explain NetworkPolicy

Expected answer:

- The policy selects the Nginx Pods by label.
- It controls ingress traffic.
- It allows traffic matching the rule in the policy.
- Enforcement depends on the Kubernetes network plugin.

Useful inspection commands:

```bash
kubectl get networkpolicy -n docker-course
kubectl describe networkpolicy -n docker-course
```
