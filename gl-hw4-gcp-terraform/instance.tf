resource "google_compute_instance" "web" {
  name         = "wp-server"
  machine_type = var.vm_type
  zone         = var.gcp_zone_1

  tags = ["http", "https", "ssh", "icmp"]

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  metadata_startup_script = file("./scripts/setup_wp.sh")

  network_interface {
    network    = google_compute_network.vpc.name
    subnetwork = google_compute_subnetwork.public_subnet_1.name

    access_config {
    }
  }
}