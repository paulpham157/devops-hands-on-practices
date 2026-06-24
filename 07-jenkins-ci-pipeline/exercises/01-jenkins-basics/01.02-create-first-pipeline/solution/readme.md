# Create the First Pipeline

The minimal Pipeline is:

```groovy
pipeline {
  agent any
  stages {
    stage('Hello') {
      steps {
        echo 'Hello from Jenkins'
      }
    }
  }
}
```

Key ideas:

- `pipeline` wraps a Declarative Pipeline.
- `agent any` allows Jenkins to run on any available executor.
- `stage` names a visible build phase.
- `steps` contains the actual work.

