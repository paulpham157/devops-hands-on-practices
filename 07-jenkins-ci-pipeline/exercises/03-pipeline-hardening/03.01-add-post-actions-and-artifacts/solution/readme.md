# Add Post Actions and Artifacts

Update the metadata block in `sample-app/Jenkinsfile`:

```bash
{
  echo "image=${IMAGE_NAME}:${IMAGE_TAG}"
  echo "build_number=${BUILD_NUMBER}"
  echo "job_name=${JOB_NAME}"
  echo "git_commit=$(git -C /workspace/devops-hands-on-practices rev-parse --short HEAD 2>/dev/null || echo unknown)"
} > build/metadata.txt
```

Jenkins archives the file with:

```groovy
archiveArtifacts artifacts: 'build/metadata.txt', fingerprint: true
```

After a build, open:

```text
Build -> Artifacts -> metadata.txt
```

