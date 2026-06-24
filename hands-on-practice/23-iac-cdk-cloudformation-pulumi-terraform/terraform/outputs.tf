output "bucket_name" {
  description = "Name of the training bucket."
  value       = module.training_bucket.bucket_name
}

output "bucket_arn" {
  description = "ARN of the training bucket."
  value       = module.training_bucket.bucket_arn
}

