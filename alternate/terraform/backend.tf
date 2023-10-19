terraform {
  backend "azurerm" {
    resource_group_name   = "myTerraformStateRG"
    storage_account_name  = "myterraformstateaccount"
    container_name        = "terraformstate"
    key                   = "prod.terraform.tfstate"
  }
}