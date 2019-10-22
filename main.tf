locals {
  output_workload_path    = "${var.output_path}${var.name}.yaml"
  output_ingress_cfg_path = "${var.output_path}${var.name}.yaml"
}

resource "local_file" "workload" {
  count = var.generate_workload_file ? 1 : 0
  content = templatefile("${path.module}/templates/simple_k8s_workload.tpl", {
                            WORKLOAD_NAME  = var.name
                            REPLICAS_COUNT = var.replicas_count,
                            IMAGE          = var.image,
                            SERVICE_PORT   = var.service_port,
                            ENV_VARS       = var.env_vars,
                            ADD_CMD        = var.comand != null,
                            CMD            = var.comand,
                            CMD_ARGS       = var.args
                          })

  filename = local.output_workload_path
}

resource "local_file" "ingress_routing" {
  count = var.generate_ingress_file ? 1 : 0
  content = templatefile("${path.module}/templates/simple_ingress_routing.tpl", {
                            INGRESS_NAME     = var.name
                            INGRESS_HOST     = var.ingress_host_name,
                            BACKEND_SERVICES = var.ingress_backend_services
                          })

  filename = local.output_ingress_cfg_path
}