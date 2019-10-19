locals {
  output_workload_path = "${var.output_path}${var.name}.yaml"
}

resource "local_file" "this" {
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