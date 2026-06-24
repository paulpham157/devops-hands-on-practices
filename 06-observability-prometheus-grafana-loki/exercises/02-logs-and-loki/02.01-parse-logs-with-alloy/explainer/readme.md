# Parse Logs with Alloy

The app writes JSON logs to `/var/log/course/app.log`. Alloy tails that file, parses JSON fields, turns selected fields into labels, and sends the result to Loki.

Labels should be low-cardinality. Good labels include `service`, `level`, `method`, and `status`. Avoid labels like request ID or full URL because they create too many unique streams.

Fields that are useful but high-cardinality can stay as structured metadata instead of labels.

