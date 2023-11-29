# Security Level: Top Secret
# This file contains sensitive information

resource "azurerm_mssql_server" "sqlserver" {
  name                         = "my-az-sql-server"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "$UPER53cr37p455w0rd"

  tags = var.tags
}

resource "azurerm_mssql_database" "sqldb" {
  name           = "my-az-mssql-db"
  server_id      = azurerm_mssql_server.sqlserver.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 1
  read_scale     = false
  sku_name       = "S0"

  tags = var.tags
}

data "azurerm_mssql_database" "sqldbdata" {
  name      = "my-az-mssql-db"
  server_id = azurerm_mssql_server.sqlserver.id

  depends_on = [
    azurerm_mssql_database.sqldb
  ]
}

output "database_id" {
  value = data.azurerm_mssql_database.sqldbdata.id
}

output "sql_server_name" {
  value = azurerm_mssql_server.sqlserver.name
}

