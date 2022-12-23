resource "google_compute_firewall" "allow-icmp" {
  name    = "${var.gcp_project}-fw-allow-icmp"
  network = google_compute_network.vpc.name
  allow {
    protocol = "icmp"
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["icmp"]
}

# allow http traffic
resource "google_compute_firewall" "allow-http" {
  name    = "${var.gcp_project}-fw-allow-http"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http"]
}
# allow https traffic
resource "google_compute_firewall" "allow-https" {
  name    = "${var.gcp_project}-fw-allow-https"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["https"]
}
# allow ssh traffic
resource "google_compute_firewall" "allow-ssh" {
  name    = "${var.gcp_project}-fw-allow-ssh"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}
# allow rdp traffic
resource "google_compute_firewall" "allow-rdp" {
  name    = "${var.gcp_project}-fw-allow-rdp"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["rdp"]
}