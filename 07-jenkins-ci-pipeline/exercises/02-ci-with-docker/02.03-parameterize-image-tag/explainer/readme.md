# Parameterize Image Tag

Jenkins parameters let an operator choose controlled inputs before a build starts.

The sample pipeline tags images with `BUILD_NUMBER`. That is good for uniqueness, but a parameter is useful when practicing release tags such as `dev`, `candidate`, or `v1.0.0`.

Do not let arbitrary parameters publish trusted release images without review.
