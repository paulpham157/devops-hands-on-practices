variable "project_name" {
  description = "Short name used as the prefix for local Docker resources."
  type        = string
  default     = "docker-course"
  nullable    = false

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9-]{2,30}$", var.project_name))
    error_message = "project_name must be 3-31 lowercase letters, numbers, or hyphens, and must start with a letter or number."
  }
}

variable "environment" {
  description = "Environment label used in the local container name."
  type        = string
  default     = "dev"
  nullable    = false

  validation {
    condition     = contains(["dev", "test", "stage"], var.environment)
    error_message = "environment must be one of: dev, test, stage."
  }
}

variable "host_port" {
  description = "Host port mapped to the Nginx container."
  type        = number
  default     = 8095
  nullable    = false

  validation {
    condition     = var.host_port >= 1024 && var.host_port <= 65535
    error_message = "host_port must be between 1024 and 65535."
  }
}

variable "image_name" {
  description = "Nginx image tag to run."
  type        = string
  default     = "nginx:1.27-alpine"
  nullable    = false
}

variable "keep_image_locally" {
  description = "Keep the Docker image on the local machine after the container is destroyed."
  type        = bool
  default     = false
  nullable    = false
}
