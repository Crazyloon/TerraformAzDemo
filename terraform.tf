terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.82.0"
    }
  }

  required_version = ">=1.6.2"
}

provider "azurerm" {
  features {}
}