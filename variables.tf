variable "environment_names" {
  description = "Create environments with these names"
  type = list
}

variable "launchdarkly_access_token" {
  description = "The Launchdarkly access token required to provision resources"
}

variable "project_names" {
  description = "Create projects with these names"
  type        = list
}

variable "env_color" {
  description = "Default color to be assigned to all environments created"
  default = "0a8b2f"
}

variable "tags" {
  description = "Tags to be assigned to all resources created"
  default = [
    "terraform",
  ]
}