# Tune Alert Threshold

## Task

Edit `prometheus/rules/course-app.yml`.

Change the `CourseAppHighErrorRate` alert threshold from:

```promql
course_app:http_requests:error_rate5m > 0.05
```

to:

```promql
course_app:http_requests:error_rate5m > 0.01
```

Then restart or reload Prometheus and generate failing traffic with `/fail`.

## Done When

Prometheus shows the updated expression and the alert transitions toward firing after the configured `for` window.
