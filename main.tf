module "resource_group" {
  source = "./modules/resource-group"

  name     = "rg-${var.project_name}-${var.environment}"
  location = var.location

  tags = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
  }
}

module "virtual_network" {
  source = "./modules/virtual-network"

  name                = "vnet-${var.project_name}-${var.environment}"
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name

  address_space = ["10.0.0.0/16"]

  subnets = {
    web = {
      address_prefixes = ["10.0.1.0/24"]
    }

    app = {
      address_prefixes = ["10.0.2.0/24"]
    }
  }

  tags = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
  }
}
module "storage_account" {
  source = "./modules/storage-account"

  name                = var.storage_account_name
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location

  tags = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
  }
}
