# Terraform configuration
terraform {
  backend "remote" {
    organization = "spooked"

    workspaces {
      name = "iac-week5"
    }
  }

  required_providers {
    esxi = {
      source = "josenk/esxi"
    }
    local = {
      source = "hashicorp/local"
    }
  }
}

provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_hostssl  = var.esxi_hostssl
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}