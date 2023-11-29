# Primary Resource Group for this set of infrastructure
resource "azurerm_resource_group" "rg" {
  name     = "my-demo-az-resource-group"
  location = var.location

  tags = local.tags
}

# Create a virtual network
resource "azurerm_network_security_group" "nsg" {
  name                = "example-security-group"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule = [{
    name                                       = "test123"
    description                                = "testRule"
    protocol                                   = "Tcp"
    source_port_range                          = "*"
    destination_port_range                     = "*"
    source_address_prefix                      = "*"
    access                                     = "Allow"
    priority                                   = 100
    direction                                  = "Inbound"
    destination_address_prefix                 = "*"
    destination_address_prefixes               = null
    destination_application_security_group_ids = null
    destination_port_ranges                    = null
    source_address_prefixes                    = null
    source_application_security_group_ids      = null
    source_port_ranges                         = null
  }]

  tags = local.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = "my-az-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  subnet {
    name           = "my-az-subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "my-az-subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.nsg.id
  }

  tags = local.tags
}

module "azure_sql_server_db" {
  source = "./modules/az-sql-database"

  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.tags
}

module "windows_function_app" {
  source = "./modules/az-windows-function-app"

  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.tags
}