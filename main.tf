
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.7.0"
    }
  }

required_version = ">=1.2.0"
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "ResGroup" {
  name = "RG-SCUSTFStorage"
  location = "East US"
}
