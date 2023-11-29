resource "azurerm_storage_account" "storage_acc" {
  name                     = "mysuperawesomeexamplesa"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "sp" {
  name                = "exampleappserviceplan"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Windows"
  sku_name            = "Y1"
}

resource "azurerm_windows_function_app" "fa" {
  name                = "examplewindowsfunctionapp"
  resource_group_name = var.resource_group_name
  location            = var.location

  storage_account_name       = azurerm_storage_account.storage_acc.name
  storage_account_access_key = azurerm_storage_account.storage_acc.primary_access_key
  service_plan_id            = azurerm_service_plan.sp.id

  site_config {}
}