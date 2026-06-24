# Run Tests in Docker

## Task

Break and then fix a test to see Jenkins fail and recover.

## Steps

1. Edit `sample-app/tests/test_app.py`.
2. Change one expected value so a test fails.
3. Run the `docker-course-sample-app` Jenkins job.
4. Confirm the `Unit Tests` stage fails.
5. Fix the test.
6. Run the job again.

## Done When

The failed run clearly shows a pytest assertion error, and the fixed run passes.

