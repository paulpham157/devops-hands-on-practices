variable "container_name" {
  description = "Name of the local Docker container managed by Terraform."
  type        = string
  default     = "docker-course-terraform-nginx"
  nullable    = false
}

variable "host_port" {
  description = "Host port mapped to the Nginx container."
  type        = number
  default     = 8083
  nullable    = false

  validation {
    condition     = var.host_port >= 1024 && var.host_port <= 65535
    error_message = "host_port must be between 1024 and 65535."
  }
}

variable "nginx_image" {
  description = "Nginx image tag to run."
  type        = string
  default     = "nginx:1.27-alpine"
  nullable    = false
}

