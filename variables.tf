variable "environments" {
  description = "Create environments with these names"
}

variable "projects" {
  description = "Create projects with these names"
}

variable "tags" {
  description = "Tags to be assigned to all resources created"
  default = [
    "terraform",
  ]
}