variable "project_names" {
    description ="list of project names"
    type = list(any)
}

variable "environment_names" {
    description = "list of environment names"
    type        = list(object({
        name = string
        color = string
        key = string
        tags = list(string)
  }))
}