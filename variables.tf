variable "generate_workload_file" {
  description = "Put false if we don't need to generate workload file"
  type        = bool
  default     = true
}

variable "generate_ingress_file" {
  description = "Put true if we need to generate ingress controller file"
  type        = bool
  default     = false
}

variable "name" {
  description   = "Name of your workload/ingress controller."
  type          = string
}

variable "replicas_count" {
  description   = "How many replicas has to be for this deployment."
  type          = number
  default       = 1
}

variable "image" {
  description   = "Image that will be used for this deployment."
  type          = string
  default       = null
}

variable "service_port" {
  description   = "Which port to open for this service."
  type          = number
  default       = -1
}

variable "env_vars" {
  description   = "Envirment variables that will be passed to container."
  type          = map(string)
  default       = null
}

variable "output_path" {
  description   = "Output path for generated workload yaml file. Should end in a forward slash `/`."
  type          = string
  default       = "out/"
}

variable "add_cmd" {
  description   = "Set to true if pod has to launch with command and args"
  type          = bool
  default       = false
}

variable "comand" {
  description   = "Command name to execute on pod start."
  type          = string
  default       = null
}

variable "args" {
  description   = "Command args to run docker container."
  type          = string
  default       = null
}

variable "cfg_map_vars" {
  description   = "Envirment variables that will be used in ConfigMap object as dataStrings."
  type          = map(string)
  default       = null
}

variable "secret_vars" {
  description   = "Envirment variables that will be used in secrets object."
  type          = map(string)
  default       = null
}

variable "ingress_host_name" {
  description   = "What kind of host will be used to configure ingress controller."
  type          = string
  default       = null
}

variable "ingress_backend_services" {
  description         = "Backend services to route trafic to."
  type = list(object({
    api_context_path  = string
    service_name      = string
    service_port      = number
  }))
  default             = null
}