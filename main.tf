

# Configure the Microsoft Azure Provider
provider "azurerm" {
   version = "~> 2.29.0" 
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.appservicename
  location = var.location
}

resource "azurerm_app_service_plan" "appplan" {
  name = "sakib-appserviceplan"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    size = "S1"
    tier = "Standard"
  }
 
}

resource "azurerm_app_service" "appservice" {
  name = "sakib-appservice"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.appplan.id
   https_only            = true
  site_config { 
    dotnet_framework_version = "v4.0"
    remote_debugging_enabled = true
    remote_debugging_version = "VS2019"
}
}

