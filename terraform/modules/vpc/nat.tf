resource "google_compute_router" "router" {
  name    = var.router-name
  region  = var.region
  network = google_compute_network.ps-dev-vpc.name
}

resource "google_compute_router_nat" "nat" {
  name                               = "${var.router-name}-nat"
  router                             = google_compute_router.router.name
  region                             = var.region
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  nat_ip_allocate_option             = "AUTO_ONLY"

}