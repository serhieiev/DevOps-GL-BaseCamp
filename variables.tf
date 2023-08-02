# GCP authentication file
variable "gcp_auth_file" {
  type        = string
  description = "GCP authentication file"
}

# define GCP project name
variable "gcp_project" {
  type        = string
  description = "GCP project name"
}

# define GCP region
variable "gcp_region_1" {
  type        = string
  description = "GCP region"
}

# define GCP zone
variable "gcp_zone_1" {
  type        = string
  description = "GCP zone"
}

# define Public subnet
variable "public_subnet_cidr_1" {
  type        = string
  description = "Public subnet CIDR 1"
}

# define VM type
variable "vm_type" {
  type        = string
  description = "GCP VM type"
  default     = "e2-micro"
}

# define vm boot disk image
variable "image" {
  type        = string
  description = "The disk image for vm boot"
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}