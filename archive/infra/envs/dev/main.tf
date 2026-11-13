module "resource_group" {
  source = "../../../../terraform/az_platform_modules/modules/resource-group"

  context  = local.context
  location = var.location
  tags     = local.common_tags
}

module "network" {
  source = "../../../../terraform/az_platform_modules/modules/virtual-network"

  context             = local.context
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_space       = var.vnet_address_space

  subnets = {
    aks_system = {
      name             = "snet-aks-system"
      address_prefixes = var.aks_system_subnet_address_prefixes
    }
  }

  tags = local.common_tags
}

module "aks" {
  source = "../../../../terraform/az_platform_modules/modules/aks"

  context             = local.context
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location

  default_node_pool = {
    name       = "system"
    vm_size    = var.aks_default_node_pool_vm_size
    subnet_id  = module.network.subnet_ids["aks_system"]
    node_count = var.aks_default_node_pool_node_count
  }

  tags = local.common_tags
}
