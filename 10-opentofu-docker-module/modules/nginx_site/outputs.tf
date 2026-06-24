output "container_id" {
  description = "Docker container ID."
  value       = docker_container.nginx.id
}

output "container_name" {
  description = "Name of the local Docker container."
  value       = var.container_name
}

output "container_url" {
  description = "Local URL for browser testing."
  value       = "http://localhost:${var.host_port}"
}

output "host_port" {
  description = "Host port mapped to Nginx."
  value       = var.host_port
}

output "image_name" {
  description = "Docker image used by the Nginx container."
  value       = var.image_name
}
