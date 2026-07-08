# Parameterize Image Tag

## Task

Add a string parameter named `IMAGE_TAG_OVERRIDE` to `sample-app/Jenkinsfile`.

Use it so:

- empty value keeps the current `BUILD_NUMBER` tag,
- non-empty value overrides the tag used by build and smoke test.

Run the Jenkins job twice: once with no override and once with a custom tag.

## Done When

The Docker image list shows one image tagged by build number and one image tagged by your override.
