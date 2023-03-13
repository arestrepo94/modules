variable "name" {
  type        = string
  description = "(Required) nombre del recurso"
}
variable "location" {
  type        = string
  description = "(Required) nombre de la region donde se desplegara el recurso"
}
variable "resource_group_name" {
  type        = string
  description = "(Required) nombre del grupo de recursos el donde estara alojado el recurso"
}
variable "account_kind" {
  type        = string
  description = "(Required) Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Changing this forces a new resource to be created. Defaults to StorageV2"
}
variable "account_tier" {
  type        = string
  description = "(Required) (Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created"
}
variable "access_tier" {
  type        = string
  description = "(Required) Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool, defaults to Hot."
}
variable "account_replication_type" {
  type        = string
  description = "(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
}
variable "enable_static_website" {
  description = "Controls if static website to be enabled on the storage account. Possible values are `true` or `false`"
  default     = false
}
variable "index_path" {
  description = "path from your repo root to index.html"
  default     = "index.html"
}
variable "custom_404_path" {
  description = "path from your repo root to your custom 404 page"
  default     = "404.html"
}
variable "tag_environment"{
	default =  ""
	description = "Variable para etiquetar los recursos con el tipo de ambiente"
}
variable "tag_name_app"{
	default = ""
	description = "Variable para etiquetar los recursos con el nombre de la aplicacion"
}
variable "tag_business_domain"{
	default = ""
	description = "Variable para etiquetar los recursos con el tipo de proceso de negocio al cual esta asociada la aplicacion"
}
variable "tag_service_domain"{
	default = ""
	description = "Variable para etiquetar los recursos con el tipo de proceso de negocio al cual esta asociada la aplicacion"
}
variable "tag_business_area"{
	default = ""
	description = "Variable para etiquetar los recursos con el nombre del area de negocio a la cual pertenece la aplicacion"
}
variable "tag_organizational_units"{
	default = ""
	description = "Variable para etiquetar los recursos con el nombre de la unidad organizacional a la cual pertenece la  aplicacion"
	}
variable "tag_name_service"{
	default = "storage_account"
	description = "Variable para etiquetar los recursos con el nombre del tipo de servicio desplegado"
}
variable "tag_cost"{
	default = ""
	description = "Variable para etiquetar los recursos con el nombre de la aplicacion asociado a su control de costos"
}
variable "containers_list" {
  description = "List of containers to create and their access levels."
  type        = list(object({ name = string, access_type = string }))
  default     = []
}
variable "tables" {
  description = "List of storage tables."
  type        = list(string)
  default     = []
}
variable "network_rules" {
  description = "Network rules restricing access to the storage account."
  type        = object({ bypass = list(string), ip_rules = list(string), subnet_ids = list(string) })
  default     = null
}