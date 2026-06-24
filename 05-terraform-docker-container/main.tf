provider "docker" {}

resource "docker_image" "nginx" {
  name         = var.nginx_image
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.container_name

  ports {
    internal = 80
    external = var.host_port
  }
}

