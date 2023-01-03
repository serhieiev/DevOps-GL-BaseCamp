# AWS Specific Variables
variable "aws_region" {
  description = "The AWS region to deploy the resources to"
}

variable "aws_ami" {
  description = "Amazon Machine Image"
  default     = "ami-0a6b2839d44d781b2"
  type        = string
}

# Azure Specific Variables
variable "azure_location" {
  description = "The region of Azure resource group for this graf Exercise"
  type        = string
}

# Common Variables
variable "ssh_user" {
  description = "The local user account to create on the virtual machine"
  type        = string
}

variable "ssh_pub_key_file" {
  description = "The path to the public SSH key associated with the local user account"
  type        = string
}

variable "ssh_priv_key_file" {
  description = "The path to the private SSH key associated with the local user account"
  type        = string
}
