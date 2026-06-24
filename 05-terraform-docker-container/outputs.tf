output "container_name" {
  description = "Name of the Docker container."
  value       = docker_container.nginx.name
}

output "container_url" {
  description = "URL for opening the Nginx container from the host."
  value       = "http://localhost:${var.host_port}"
}

