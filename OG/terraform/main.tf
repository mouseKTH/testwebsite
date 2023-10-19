provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "mywebsite-rg"
  location = "East US"
}

resource "azurerm_storage_account" "sa" {
  name                     = "mystorageaccount"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "website" {
  name                  = "website-content"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "website_index" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = azurerm_storage_container.website.name
  type                   = "Block"
  source                 = "../website/index.html"
}
