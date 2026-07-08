# Add Timeout and Cleanup

Add the timeout inside `options`:

```groovy
options {
  buildDiscarder(logRotator(numToKeepStr: '10'))
  timeout(time: 10, unit: 'MINUTES')
}
```

The smoke test already has cleanup:

```groovy
post {
  always {
    sh 'docker rm -f jenkins-sample-app >/dev/null 2>&1 || true'
  }
}
```

Verify after a failed run:

```bash
docker compose exec docker docker ps -a --filter name=jenkins-sample-app
```

The command should not show a leftover app container.
