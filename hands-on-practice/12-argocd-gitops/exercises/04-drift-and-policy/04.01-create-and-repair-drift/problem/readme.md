# Problem: Create and Repair Drift

Run:

```bash
./scripts/simulate-drift.sh
```

Watch:

```bash
kubectl get deployment course-web -n docker-course-gitops -w
```

In another terminal:

```bash
./scripts/show-status.sh
```

Answer:

1. What manual change created drift?
2. Which Git file declares the correct replica count?
3. What should Argo CD restore?
4. Why is this useful operationally?
