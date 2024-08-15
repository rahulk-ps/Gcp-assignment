resource "google_compute_network" "ps-dev-vpc" {
  name                            = var.ps-dev-vpc
  routing_mode                    = "REGIONAL"
  auto_create_subnetworks         = false
  mtu                             = 1460
  delete_default_routes_on_create = false
}

resource "google_compute_subnetwork" "gke-subnet" {
  name                     = var.gke-subnet
  ip_cidr_range            = var.gke-subnet-cidr-range
  region                   = var.region
  private_ip_google_access = true
  network                  = google_compute_network.ps-dev-vpc.id

  secondary_ip_range {
    range_name    = var.k8s-pod-range-name
    ip_cidr_range = var.pod-cidr-range
  }

  secondary_ip_range {
    range_name    = var.k8s-service-range-name
    ip_cidr_range = var.service-cidr-range
  }

}