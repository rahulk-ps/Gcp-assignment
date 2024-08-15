# VPC


variable "ps-dev-vpc" {
  type = string
}

variable "gke-subnet" {
  type = string
}

variable "gke-subnet-cidr-range" {
  type = string
}

variable "region" {
  type = string
}

variable "k8s-pod-range-name" {
  type = string
}

variable "k8s-service-range-name" {
  type = string
}

variable "pod-cidr-range" {
  type = string
}

variable "service-cidr-range" {
  type = string
}

variable "router-name" {
  type = string
}

#################################

variable "ps-gke-cluster" {
  type = string

}

variable "zone" {
  type = string

}

