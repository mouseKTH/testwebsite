terraform {
  backend "azurerm" {
    resource_group_name   = "<RESOURCE_GROUP_NAME_PLACEHOLDER>"
    storage_account_name  = "<STORAGE_ACCOUNT_NAME_PLACEHOLDER_FOR_TERRAFORM_STATE>"
    container_name        = "<CONTAINER_NAME_PLACEHOLDER_FOR_TERRAFORM_STATE>"
    key                   = "terraform.tfstate"
  }
}
