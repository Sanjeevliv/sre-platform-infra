# 3. Create the "Always Free" tier GKE Autopilot cluster
resource "google_container_cluster" "primary" {
  name     = "sre-platform-cluster"
  location = var.region
  project  = var.project_id

  # Use the "AUTOPILOT" GKE release channel
  # This has a free tier and is fully managed by Google (good SRE Pattern)
  enable_autopilot = true

  #Networking configuration
  network    = google_compute_network.main.id
  subnetwork = google_compute_subnetwork.gke_subnet.id

  #Define how networking is configured within the cluster
  ip_allocation_policy {
    cluster_secondary_range_name  = google_compute_subnetwork.gke_subnet.secondary_ip_range[0].range_name
    services_secondary_range_name = google_compute_subnetwork.gke_subnet.secondary_ip_range[1].range_name
  }

  #This "depends_on" is not strictly required, but it's a good practice
  #It explicitly tells Terraform: "Do not try to create the cluster
  #until the network and subnets are successfully created."
  depends_on = [
    google_compute_network.main,
    google_compute_subnetwork.gke_subnet
  ]
}

# 4. Output the cluster neame after it's created
output "cluster_name" {
  value = google_container_cluster.primary.name
}

# 5. Output the cluster endpoint (IP)
output "cluster_endpoint" {
  description = "The public IP address of the GKE cluster."
  value       = google_container_cluster.primary.endpoint
}