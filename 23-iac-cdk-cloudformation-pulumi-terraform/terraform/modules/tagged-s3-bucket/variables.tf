variable "environment_name" {
  description = "Short environment name used for tags."
  type        = string
}

variable "name_prefix" {
  description = "Prefix used for bucket naming."
  type        = string
}

variable "tags" {
  description = "Additional tags to apply to the bucket."
  type        = map(string)
  default     = {}
}

