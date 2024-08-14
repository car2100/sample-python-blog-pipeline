variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "client_id" {
  description = "Azure Client ID"
  type        = string
}

variable "access_key" {
  description = "Azure Access Key"
  type        = string
}

variable "storage_account_name" {
  description = "Azure Storage Account Name"
  type        = string
}

variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Location"
  type        = string
}

variable "app_name" {
  description = "App Name"
  type        = string
}

variable "acr_url" {
  description = "Docker Registry Server URL"
  type        = string
}

variable "acr_username" {
  description = "Docker Registry Server Username"
  type        = string
}

variable "acr_password" {
  description = "Docker Registry Server Password"
  type        = string
}

variable "storage_account_string" {
  description = "Website Content Azure File Connection String"
  type        = string
}


variable "image_name" {
  description = "Docker Custom Image Name"
  type        = string
}

variable "image_tag" {
  description = "Docker Custom Image Tag"
  type        = string
}

variable "container_name" {
  description = "Azure Blob Container Name"
  type        = string
}

variable "sku_name" {
  description = "Azure Service Plan SKU Name"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "branch" {
  description = "Branch"
  type        = string
}

variable "app_name_sa" {
  description = "App Name Storage Account"
  type        = string
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.113.0"
    }
  }
  backend "azurerm" {
    storage_account_name = var.storage_account_name
    resource_group_name  = var.resource_group_name
    container_name       = var.container_name
    client_id            = var.client_id
    subscription_id      = var.subscription_id
    use_azuread_auth     = true
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  features {}
}

resource "random_string" "random" {
  length  = 5
  upper = false
  lower = true
  number = true
  special = false
}


resource "azurerm_resource_group" "example" {
  name     = "RG-${var.environment}-${var.branch}-${var.app_name}"
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = "sa${random_string.random.result}${var.app_name_sa}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "test" {
  name                = "ASP-${var.environment}-${var.branch}-${var.app_name}"
  location            = var.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Linux"
  sku_name            = "${var.sku_name}"
}

resource "azurerm_linux_function_app" "test" {
    name                      = "FUNC-${var.environment}-${var.branch}-${var.app_name}"
    location                  = var.location
    resource_group_name       = azurerm_resource_group.example.name
    service_plan_id           = azurerm_service_plan.test.id
    storage_account_access_key = azurerm_storage_account.example.primary_access_key
    storage_account_name       = azurerm_storage_account.example.name

    app_settings = {
      WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
      FUNCTIONS_EXTENSION_VERSION = "~4"
    }

    site_config {
      application_stack {
        docker {
          registry_url      = "${var.acr_url}"
          image_name        = "${var.image_name}"
          image_tag         = "${var.image_tag}"
          registry_username = "${var.acr_username}"
          registry_password = "${var.acr_password}"
        }
      }
    }
}
