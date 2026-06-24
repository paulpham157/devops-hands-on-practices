# Build and Smoke Test an Image

## Task

Change the sample app response and prove the pipeline still builds a working image.

## Steps

1. Edit `sample-app/app.py`.
2. Change the `/` message from:

```text
Jenkins CI sample app
```

to:

```text
Jenkins pipeline practice
```

3. Run the Jenkins job.
4. Confirm `Build Image` and `Smoke Test` pass.

## Done When

The pipeline succeeds and Jenkins lists the built image in the final post step.

