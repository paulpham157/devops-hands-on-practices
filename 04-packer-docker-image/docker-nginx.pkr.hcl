packer {
  required_plugins {
    docker = {
      source  = "github.com/hashicorp/docker"
      version = "~> 1"
    }
  }
}

source "docker" "ubuntu" {
  image   = "ubuntu:24.04"
  commit  = true
  changes = [
    "EXPOSE 80",
    "CMD [\"nginx\", \"-g\", \"daemon off;\"]"
  ]
}

build {
  name = "docker-course-packer-nginx"

  sources = [
    "source.docker.ubuntu"
  ]

  provisioner "shell" {
    environment_vars = [
      "DEBIAN_FRONTEND=noninteractive"
    ]

    inline = [
      "apt-get update",
      "apt-get install -y --no-install-recommends nginx ca-certificates",
      "rm -rf /var/lib/apt/lists/*"
    ]
  }

  provisioner "file" {
    source      = "files/index.html"
    destination = "/var/www/html/index.html"
  }

  post-processor "docker-tag" {
    repository = "docker-course/packer-nginx"
    tags       = ["1.0"]
  }
}
