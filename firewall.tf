resource "google_compute_firewall" "allow_http_https" {
  name    = "${local.prefix_name}-allow-http-https"
  network = google_compute_network.vpc.name
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server", "https-server"]
}

#tfsec:ignore:google-compute-no-public-ingress
resource "google_compute_firewall" "allow_ssh" {
  name    = "${local.prefix_name}-allow-ssh"
  network = google_compute_network.vpc.name
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "udp"
    ports    = ["1194"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}

resource "google_compute_firewall" "allow_internal" {
  name    = "${local.prefix_name}-allow-internal"
  network = google_compute_network.vpc.name
  project = var.project_id

  allow {
    protocol = "all"
  }

  source_ranges = [for subnet in var.subnets : subnet.ip_cidr_range]
}