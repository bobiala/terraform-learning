provider "docker" {
  host = "tcp://docker:2345/"
}
resource "docker_image" "nginx" {
  name = "nginx:1.12-alpine"
}
resource "docker_container" "nginx-server" {
  count = 2
  name = "nginx-server"
  image = "${docker_image.nginx.latest}"
  ports {
    internal = 80
  }
  volumes {
    container_path  = "/usr/share/nginx/html"
    host_path = "/home/devel/www"
    read_only = true
  }
}
