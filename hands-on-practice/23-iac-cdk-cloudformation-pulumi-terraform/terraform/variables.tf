variable "aws_region" {
  description = "AWS region for the provider."
  type        = string
  default     = "us-east-1"
}

variable "environment_name" {
  description = "Short environment name used for tags."
  type        = string
  default     = "dev"

  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.environment_name))
    error_message = "environment_name must contain only lowercase letters, numbers, and hyphens."
  }
}

variable "name_prefix" {
  description = "Prefix used to name training resources."
  type        = string
  default     = "iac-training"
}

