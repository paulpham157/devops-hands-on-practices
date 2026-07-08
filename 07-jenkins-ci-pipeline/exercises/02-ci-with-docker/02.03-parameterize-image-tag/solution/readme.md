# Parameterize Image Tag

Add a parameter:

```groovy
parameters {
  string(name: 'IMAGE_TAG_OVERRIDE', defaultValue: '', description: 'Optional image tag override')
}
```

Then compute the tag in a script block or environment-safe shell step. One simple pattern is:

```groovy
environment {
  IMAGE_TAG = "${params.IMAGE_TAG_OVERRIDE ?: env.BUILD_NUMBER}"
}
```

Verify:

```bash
docker compose exec docker docker image ls docker-course/jenkins-sample-app
```
