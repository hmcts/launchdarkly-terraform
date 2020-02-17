variable "environment_names" {
  description = "Create environments with these names"
}

variable "project_names" {
  description = "Create projects with these names"
}

variable "tags" {
  description = "Tags to be assigned to all resources created"
  default = [
    "terraform",
  ]
}