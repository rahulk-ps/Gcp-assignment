module "vpc" {
  source                 = "./modules/vpc"
  ps-dev-vpc             = var.ps-dev-vpc
  gke-subnet             = var.gke-subnet
  gke-subnet-cidr-range  = var.gke-subnet-cidr-range
  region                 = var.region
  k8s-pod-range-name     = var.k8s-pod-range-name
  k8s-service-range-name = var.k8s-service-range-name
  pod-cidr-range         = var.pod-cidr-range
  service-cidr-range     = var.service-cidr-range
  router-name            = var.router-name

}

module "gke" {
  source         = "./modules/gke"
  ps-gke-cluster = var.ps-gke-cluster
  zone           = var.zone
  ps-dev-vpc     = module.vpc.ps-dev-vpc-name
  gke-subnet     = module.vpc.gke-subnet-name
  region         = var.region

}