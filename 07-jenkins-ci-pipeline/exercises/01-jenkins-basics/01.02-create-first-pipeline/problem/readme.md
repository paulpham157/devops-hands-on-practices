# Create the First Pipeline

## Task

Create a second Pipeline job manually.

## Steps

1. Open Jenkins.
2. Select `New Item`.
3. Name it:

```text
manual-hello-pipeline
```

4. Choose `Pipeline`.
5. Paste this Pipeline script:

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

6. Save and click `Build Now`.

## Done When

The console output contains:

```text
Hello from Jenkins
```

