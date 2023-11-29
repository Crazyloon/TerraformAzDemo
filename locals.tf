locals {
  tags = {
    department  = "${var.company}-${var.department}"
    environment = "${var.deployment_environment}"
    version     = "${var.deployment_version}"
  }
}