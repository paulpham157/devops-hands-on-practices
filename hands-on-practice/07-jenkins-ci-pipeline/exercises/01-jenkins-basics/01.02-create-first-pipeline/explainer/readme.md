# Create the First Pipeline

A Jenkins Pipeline is a series of stages. Each stage has steps.

The preferred pattern is Pipeline as Code:

```text
Jenkinsfile in source control -> Jenkins reads it -> Jenkins executes stages
```

This lesson auto-creates a job from `sample-app/Jenkinsfile`, so you can inspect a real pipeline before creating one manually.

