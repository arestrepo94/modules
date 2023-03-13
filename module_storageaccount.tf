#---------------------------------------------------------
# Storage Account Creation 
#----------------------------------------------------------
resource "azurerm_storage_account" "stac" {
	name						= var.name
	location					= var.location
	resource_group_name			= var.resource_group_name
	account_kind				= var.account_kind
	account_tier				= var.account_tier
	access_tier					= var.access_tier
	account_replication_type	= var.account_replication_type
	enable_https_traffic_only	= true
	tags		= {
        environment				= var.tag_environment
		app						= var.tag_name_app
		organizational_units	= var.tag_organizational_units
		business_area			= var.tag_business_area
		business_domain			= var.tag_business_domain
		service_domains			= var.tag_service_domain
		cost					= var.tag_cost
		name_service			= var.tag_name_service
		}
dynamic "network_rules" {
    for_each = var.network_rules != null ? ["true"] : []
    content {
      default_action             = "Deny"
      bypass                     = var.network_rules.bypass
      ip_rules                   = var.network_rules.ip_rules
      virtual_network_subnet_ids = var.network_rules.subnet_ids
    }
  }
 dynamic "static_website" {
	for_each = local.if_static_website_enabled
		content {
		index_document     = var.index_path
		error_404_document = var.custom_404_path
    }
  }  
}
#-------------------------------
# Storage Container Creation
#-------------------------------
resource "azurerm_storage_container" "container" {
  count                 = length(var.containers_list)
  name                  = var.containers_list[count.index].name
  storage_account_name  = azurerm_storage_account.stac.name
  container_access_type = var.containers_list[count.index].access_type
}
#-------------------------------
# Storage Tables Creation
#-------------------------------
resource "azurerm_storage_table" "tables" {
  count                = length(var.tables)
  name                 = var.tables[count.index]
  storage_account_name = azurerm_storage_account.stac.name
}
