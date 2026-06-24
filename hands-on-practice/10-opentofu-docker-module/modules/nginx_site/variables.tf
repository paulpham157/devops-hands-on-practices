variable "container_name" {
  description = "Name of the local Docker container managed by OpenTofu."
  type        = string
  nullable    = false

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9-]{2,60}$", var.container_name))
    error_message = "container_name must be 3-61 lowercase letters, numbers, or hyphens, and must start with a letter or number."
  }
}

variable "host_port" {
  description = "Host port mapped to the Nginx container."
  type        = number
  nullable    = false

  validation {
    condition     = var.host_port >= 1024 && var.host_port <= 65535
    error_message = "host_port must be between 1024 and 65535."
  }
}

variable "image_name" {
  description = "Nginx image tag to run."
  type        = string
  nullable    = false

  validation {
    condition     = length(trimspace(var.image_name)) > 0
    error_message = "image_name must not be empty."
  }
}

variable "keep_image_locally" {
  description = "Keep the Docker image on the local machine after the container is destroyed."
  type        = bool
  nullable    = false
}
