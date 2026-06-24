provider "docker" {}

module "nginx_site" {
  source = "./modules/nginx_site"

  container_name     = local.container_name
  host_port          = var.host_port
  image_name         = var.image_name
  keep_image_locally = var.keep_image_locally
}
