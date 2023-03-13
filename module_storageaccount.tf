resource "azurerm_storage_account" "stac" {
	name						= var.name
	location					= var.location
	resource_group_name			= var.resource_group_name
	account_kind				= var.account_kind
	account_tier				= local.account_tier
	account_replication_type	= local.account_replication_type
	access_tier					= var.access_tier
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
}