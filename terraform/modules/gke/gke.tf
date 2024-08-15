resource "google_container_cluster" "ps-gke-cluster" {
  name                     = var.ps-gke-cluster
  location                 = var.region
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = var.ps-dev-vpc
  subnetwork               = var.gke-subnet
  networking_mode          = "VPC_NATIVE"

  addons_config {
    horizontal_pod_autoscaling {
      disabled = false
    }
  }
  release_channel {
    channel = "STABLE"
  }
  ip_allocation_policy {
    cluster_secondary_range_name  = "k8s-pod-range"
    services_secondary_range_name = "k8s-service-range"
  }
  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "10.0.0.0/28"
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = "10.142.0.0/20"
    }
    
  
  }
}

resource "google_service_account" "kubernetes" {
  account_id = "kubernetes-svc"

}

resource "google_container_node_pool" "gke-node-pool" {
  name       = "${var.ps-gke-cluster}-nodepool"
  cluster    = google_container_cluster.ps-gke-cluster.name
  node_count = 0
  location = var.region

  management {
    auto_repair  = true
    auto_upgrade = true
  }
  node_config {
    preemptible     = false
    machine_type    = "e2-medium"
    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

  }
  depends_on = [google_container_cluster.ps-gke-cluster]
}