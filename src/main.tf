terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "daniloperiottodegodoy" {
  name         = "daniloperiottodegodoy/conversao-temperatura:latest"
  keep_locally = false
}

resource "docker_container" "daniloperiottodegodoy" {
  image = docker_image.daniloperiottodegodoy.image_id
  name  = "containerTesteDanilo"
  ports {
    internal = 8080
    external = 8080
  }
}