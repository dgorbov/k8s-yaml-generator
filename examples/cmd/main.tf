terraform {
  required_version = ">= 0.12.0"
}

provider "local" {
  version = "~> 1.4"
}

provider "template" {
  version = "~> 2.1"
}

module "k8s_app_with_cmd" {
  source = "../../"

  name   = "show-host-name"
  image  = "debian"
  comand = "printenv"
  args   = "\"HOSTNAME\", \"KUBERNETES_PORT\""
}