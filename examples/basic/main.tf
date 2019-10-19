terraform {
  required_version = ">= 0.12.0"
}

provider "local" {
  version = "~> 1.4"
}

provider "template" {
  version = "~> 2.1"
}

module "my_k8s_app" {
  source = "../../"

  name          = "nginx"
  image         = "nginx"
  service_port  = 80
  env_vars      = { NGINX_HOST = "foobar.com", NGINX_PORT = "80" }
}

output "new_file_name" {
  value = module.my_k8s_app.workload_file_name
}