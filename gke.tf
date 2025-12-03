resource "google_container_cluster" "primary" {
  name     = "sre-platform-cluster"
  location = var.region
  project  = var.project_id

    enable_autopilot = true

 
  network    = google_compute_network.main.id
  subnetwork = google_compute_subnetwork.gke_subnet.id

 
  ip_allocation_policy {
    cluster_secondary_range_name  = google_compute_subnetwork.gke_subnet.secondary_ip_range[0].range_name
    services_secondary_range_name = google_compute_subnetwork.gke_subnet.secondary_ip_range[1].range_name
  }

 
  depends_on = [
    google_compute_network.main,
    google_compute_subnetwork.gke_subnet
  ]
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}
output "cluster_endpoint" {
  description = "The public IP address of the GKE cluster."
  value       = google_container_cluster.primary.endpoint
}