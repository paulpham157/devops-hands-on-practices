resource "docker_image" "nginx" {
  name         = var.image_name
  keep_locally = var.keep_image_locally
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.container_name

  ports {
    internal = 80
    external = var.host_port
  }
}
