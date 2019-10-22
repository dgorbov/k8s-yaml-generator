terraform {
  required_version = ">= 0.12.0"
}

provider "local" {
  version = "~> 1.4"
}

provider "template" {
  version = "~> 2.1"
}

module "k8s_ingress_rounting" {
  source = "../../"

  generate_workload_file    = false
  generate_ingress_file     = true
  name                      = "sample-ingress-rounting"
  ingress_host_name         = "api.example.com"
  ingress_backend_services  = [
    {
        api_context_path = "/backend1"
        service_name     = "backend1_k8s_service"
        service_port     = 8080
    },
    {
        api_context_path = "/backend2"
        service_name     = "backend2_k8s_service"
        service_port     = 8081
    }
  ]
}