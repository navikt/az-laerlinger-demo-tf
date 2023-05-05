# provider - what to configure, aws, azure, gcp, etc - focus on azure with azurerm provider

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.55.0"
    }
  }
}

provider "azurerm" {
  # which data hall to work within
  subscription_id = "1abe8fed-e8e6-4365-afea-ed8ba68a94b8"
  features {}
}

locals {
    default_location = "norwayeast"
    default_tags = {
        demo = "lærlinger"
        provenance = "https://github.com/navikt/az-laerlinger-demo-tf"
    }
}

# create resource group

resource "azurerm_resource_group" "rg" {
  name     = "demo-reg"
  location = local.default_location
  tags     = local.default_tags
}
