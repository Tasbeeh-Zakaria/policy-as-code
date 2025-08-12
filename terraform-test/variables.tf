variable "environment" {
  description = "Deployment environment tag"
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Common tags for resources"
  type        = map(string)
  default = {
    environment = "dev"
    owner       = "automation"
  }
}
