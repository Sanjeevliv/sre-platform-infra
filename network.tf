# 1. Create a custom VPC(Virtual Private Cloud 'private network')
resource "google_compute_network" "main" {
  name                    = "sre-platform-vpc"
  auto_create_subnetworks = false # SRE Best Practice: Use a custom subnets
  project                 = var.project_id
}

# 2. Create a subnet for the GKE cluster in our chosen region 
resource "google_compute_subnetwork" "gke_subnet" {
  name          = "gke-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.region
  network       = google_compute_network.main.id
  project       = var.project_id

  # Define secondary ranges for GKE Pods and Services
  secondary_ip_range {
    range_name    = "gke-pods-range"
    ip_cidr_range = "10.1.0.0/16"
  }

  secondary_ip_range {
    range_name    = "gke-services-range"
    ip_cidr_range = "10.2.0.0/16"
  }
}