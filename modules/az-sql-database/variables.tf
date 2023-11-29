# Input variables

variable "location" {
  description = "The cloud region this infrastructure should be hosted on"
  type = string
  default = "westus2"
}

variable "resource_group_name" {
  description = "The name of the resource group you will assign this SQL DB to"
  type = string
}

variable "tags" {
  description = "default tags for resources in this module"
  type = map(string)
}