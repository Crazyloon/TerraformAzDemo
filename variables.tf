variable "location" {
  description = "The deployment region for the infrastructure"
  type        = string
}

variable "deployment_version" {
  description = "A value representing the iteration version of this deployment"
  type        = string
  default     = "1.0.0"
}

variable "deployment_environment" {
  description = "The name of the environment this infrastructure represents"
  type        = string
}

variable "company" {
  description = "The name of the company this resource was created for or is owned by"
  type = string
  default = "Crazyloon Inc"
}

variable "department" {
  description = "The name of the department this resource was created for"
  type = string
}