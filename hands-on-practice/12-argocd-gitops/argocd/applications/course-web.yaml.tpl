apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: course-web
  namespace: argocd
  labels:
    app.kubernetes.io/part-of: docker-course
    docker-course.dev/lesson: "12-argocd-gitops"
spec:
  project: default
  source:
    repoURL: __REPO_URL__
    targetRevision: __TARGET_REVISION__
    path: __APP_PATH__
  destination:
    server: https://kubernetes.default.svc
    namespace: docker-course-gitops
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
      allowEmpty: false
    syncOptions:
      - CreateNamespace=true
      - PrunePropagationPolicy=foreground
      - ApplyOutOfSyncOnly=true
    retry:
      limit: 5
      backoff:
        duration: 5s
        factor: 2
        maxDuration: 3m
