terraform {
  backend "remote" {
    hostname = "terraform.gov.ab.ca"
    organization = "GOA"

    workspaces {
      name = "AZ-sub1"
    }
  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.71.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "1.6.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {
  # Configuration options
}

#get current subscription properties
data "azurerm_subscription" "primary" {
}

#create resource group for top of rack

resource "azurerm_resource_group" "tor" {
  name     = "${var.resource_naming_prefix}-rg-tor-${lower(var.resource_tags["environment"])}"
  location = var.location
  tags = var.resource_tags
}

#create resource group for vault

resource "azurerm_resource_group" "vault" {
  name     = "${var.resource_naming_prefix}-rg-vault-${lower(var.resource_tags["environment"])}"
  location = var.location
  tags = var.resource_tags
}

#apply roles to subscription

data "azuread_group" "role" {
  count = length(var.role_groups)
  display_name = var.role_groups[count.index].group
}

resource "azurerm_role_assignment" "role" {
  count = length(var.role_groups)
  scope = data.azurerm_subscription.primary.id
  role_definition_name = var.role_groups[count.index].role
  principal_id         = data.azuread_group.role[count.index].id
}

#Create virtual network
resource "azurerm_virtual_network" "vnet" {
    name                = "${var.resource_naming_prefix}-vnet-${lower(var.resource_tags["environment"])}"
    address_space       = var.vnet_address_space
    location            = azurerm_resource_group.tor.location
    resource_group_name = azurerm_resource_group.tor.name
    tags = var.resource_tags
}

