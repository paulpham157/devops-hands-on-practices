# Add Post Actions and Artifacts

## Task

Extend `sample-app/Jenkinsfile` so `build/metadata.txt` includes the Git commit if available.

Add this line to the metadata block:

```bash
echo "git_commit=$(git -C /workspace/devops-hands-on-practices rev-parse --short HEAD 2>/dev/null || echo unknown)"
```

Run the Jenkins job and download the archived artifact.

## Done When

The build artifacts include `metadata.txt`, and it contains:

```text
git_commit=
```

