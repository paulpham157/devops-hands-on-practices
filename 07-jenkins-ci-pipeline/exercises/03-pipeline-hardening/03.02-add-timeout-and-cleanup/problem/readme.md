# Add Timeout and Cleanup

## Task

Add a global Pipeline timeout to `sample-app/Jenkinsfile`:

```groovy
timeout(time: 10, unit: 'MINUTES')
```

Then intentionally break the smoke test image command or health check, run the job, and confirm the cleanup block removes `jenkins-sample-app`.

Restore the pipeline afterward.

## Done When

The Jenkins job has a timeout policy and no stopped `jenkins-sample-app` container is left behind after a failed smoke test.
