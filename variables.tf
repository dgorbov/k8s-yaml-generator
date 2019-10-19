variable "name" {
  description   = "Name of your workload."
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
}

variable "service_port" {
  description   = "Which port to open for this service."
  type          = number
}

variable "env_vars" {
  description   = "Envirment variables that will be passed to container."
  type          = map(string)
  default       = {}
}

variable "output_path" {
  description   = "Output path for generated workload yaml file. Should end in a forward slash `/`."
  type          = string
  default       = "out/"
}