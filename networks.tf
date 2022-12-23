# create VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.gcp_project}-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}

# create Public subnet
resource "google_compute_subnetwork" "public_subnet_1" {
  name          = "${var.gcp_project}-public-subnet-1"
  ip_cidr_range = var.public_subnet_cidr_1
  network       = google_compute_network.vpc.name
  region        = var.gcp_region_1
}