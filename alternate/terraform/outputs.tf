output "resource_group_name" {
  description = "The name of the created resource group"
  value       = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  description = "The location of the created resource group"
  value       = azurerm_resource_group.rg.location
}

output "app_service_plan_name" {
  description = "The name of the created App Service Plan"
  value       = azurerm_app_service_plan.main_plan.name
}

output "app_service_plan_sku_tier" {
  description = "The SKU tier of the created App Service Plan"
  value       = azurerm_app_service_plan.main_plan.sku[0].tier
}

output "app_service_plan_sku_size" {
  description = "The SKU size of the created App Service Plan"
  value       = azurerm_app_service_plan.main_plan.sku[0].size
}

output "webapp_name" {
  description = "The name of the deployed web application"
  value       = azurerm_app_service.main_app.name
}

output "webapp_url" {
  description = "The URL of the deployed web application"
  value       = azurerm_app_service.main_app.default_site_hostname
}
