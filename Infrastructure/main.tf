provider "azurerm" {
  version = "=1.38.0"

}

resource "random_password" "dbpassword" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "azurerm_resource_group" "someproduct" {
  name     = "${var.customer}-someproduct-resources"
  location = "West Europe"
}

resource "azurerm_sql_server" "someproduct" {
  name                         = "someproduct-sqlserver"
  resource_group_name          = "${azurerm_resource_group.someproduct.name}"
  location                     = "${azurerm_resource_group.someproduct.location}"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "${random_password.dbpassword.result}"
}

resource "azurerm_sql_database" "someproduct" {
  name                             = "someproductdb"
  resource_group_name              = "${azurerm_resource_group.someproduct.name}"
  location                         = "${azurerm_resource_group.someproduct.location}"
  server_name                      = "${azurerm_sql_server.someproduct.name}"
  edition                          = "Basic"
  collation                        = "SQL_Latin1_General_CP1_CI_AS"
  create_mode                      = "Default"
  requested_service_objective_name = "Basic"
}

resource "azurerm_sql_firewall_rule" "someproduct" {
  name                = "allow-azure-services"
  resource_group_name = "${azurerm_resource_group.someproduct.name}"
  server_name         = "${azurerm_sql_server.someproduct.name}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_app_service_plan" "someproduct" {
  name                = "someproduct-appserviceplan"
  location            = "${azurerm_resource_group.someproduct.location}"
  resource_group_name = "${azurerm_resource_group.someproduct.name}"
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "someproduct" {
  name                = "${var.customer}-someproduct-app"
  location            = "${azurerm_resource_group.someproduct.location}"
  resource_group_name = "${azurerm_resource_group.someproduct.name}"
  app_service_plan_id = "${azurerm_app_service_plan.someproduct.id}"
  site_config {
    linux_fx_version = "DOTNETCORE|3.1"
  }

  app_settings = {
    "APIKey"       = "${var.apikey}"
    "CustomerName" = "${var.customer}"
  }

  connection_string {
    name  = "DefaultConnection"
    type  = "SQLAzure"
    value = "Server=tcp:${azurerm_sql_server.someproduct.fully_qualified_domain_name}.database.windows.net,1433;Initial Catalog=${azurerm_sql_database.someproduct.name};Persist Security Info=False;User ID=${azurerm_sql_server.someproduct.administrator_login};Password=${random_password.dbpassword.result};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  }

}



