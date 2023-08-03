terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_subscription" "current" {
}

data "http" "myip" {
  url = "https://api.ipify.org"
}
