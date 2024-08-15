output "ps-dev-vpc-id" {
    value = google_compute_network.ps-dev-vpc.id
  
}

output "ps-dev-vpc-name" {
    value = google_compute_network.ps-dev-vpc.name
  
}

output "gke-subnet-id" {
    value = google_compute_subnetwork.gke-subnet.id
  
}

output "gke-subnet-name" {
    value = google_compute_subnetwork.gke-subnet.name
  
}

output "router-name" {
  value = google_compute_router.router.name

}

output "nat-name" {
  value = google_compute_router_nat.nat.name
}