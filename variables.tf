variable "location" {
    type = string
    description = "Azure location of terraform server environment"
    default = "Canada Central"
}

variable "resource_naming_prefix" {
    type = string
    description = "naming standard prefixes for resources"
}

variable "resource_tags" {
    type = map(string)
    description = "Tags to set for all resources" 
} 

variable "role_groups" {
  description = "Groups to assign designated access"
  type = list(object({
      group = string
      role = string
  }))
}

variable "vnet_address_space" { 
    type = list
    description = "Address space for Virtual Network"
}

