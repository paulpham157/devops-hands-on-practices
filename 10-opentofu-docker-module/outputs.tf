output "container_name" {
  description = "Name of the local Docker container."
  value       = module.nginx_site.container_name
}

output "container_url" {
  description = "Local URL for the Nginx container."
  value       = module.nginx_site.container_url
}

output "host_port" {
  description = "Host port mapped to the Nginx container."
  value       = module.nginx_site.host_port
}

output "image_name" {
  description = "Docker image used by the Nginx container."
  value       = module.nginx_site.image_name
}
