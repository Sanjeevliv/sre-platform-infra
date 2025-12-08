# Cloud DNS Configuration for sanjeevsethi.in

# Create a managed DNS zone
resource "google_dns_managed_zone" "portfolio" {
  name        = "sanjeevsethi-zone"
  dns_name    = "sanjeevsethi.in."  # Must end with a dot
  description = "DNS zone for SRE portfolio project"
  project     = var.project_id

  # DNSSEC for security (optional but good practice)
  dnssec_config {
    state = "on"
  }
}

# Output the nameservers - you'll need these for GoDaddy
output "dns_nameservers" {
  description = "Nameservers to configure in GoDaddy"
  value       = google_dns_managed_zone.portfolio.name_servers
}

# Example: A record for the main site (update IP when you have it)
# Uncomment and update when you have the actual IP
# resource "google_dns_record_set" "main" {
#   name         = google_dns_managed_zone.portfolio.dns_name
#   type         = "A"
#   ttl          = 300
#   managed_zone = google_dns_managed_zone.portfolio.name
#   project      = var.project_id
#   rrdatas      = ["YOUR_IP_HERE"]
# }

# Example: CNAME for www subdomain
# resource "google_dns_record_set" "www" {
#   name         = "www.${google_dns_managed_zone.portfolio.dns_name}"
#   type         = "CNAME"
#   ttl          = 300
#   managed_zone = google_dns_managed_zone.portfolio.name
#   project      = var.project_id
#   rrdatas      = ["sanjeevsethi.in."]
# }

# Example: A record for monitor subdomain (Grafana)
# resource "google_dns_record_set" "monitor" {
#   name         = "monitor.${google_dns_managed_zone.portfolio.dns_name}"
#   type         = "A"
#   ttl          = 300
#   managed_zone = google_dns_managed_zone.portfolio.name
#   project      = var.project_id
#   rrdatas      = ["YOUR_GKE_INGRESS_IP"]
# }
