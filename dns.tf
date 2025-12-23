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

# GitHub Pages Verification Content
resource "google_dns_record_set" "gh_verification" {
  name         = "_github-pages-challenge-Sanjeevliv.${google_dns_managed_zone.portfolio.dns_name}"
  type         = "TXT"
  ttl          = 300
  managed_zone = google_dns_managed_zone.portfolio.name
  project      = var.project_id
  rrdatas      = ["6cefc467b80342d098fb19d17febd2"]
}

# GitHub Pages A Records (Apex Domain)
resource "google_dns_record_set" "github_pages_apex" {
  name         = google_dns_managed_zone.portfolio.dns_name
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.portfolio.name
  project      = var.project_id
  rrdatas      = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153",
  ]
}

# GitHub Pages CNAME (www)
resource "google_dns_record_set" "github_pages_www" {
  name         = "www.${google_dns_managed_zone.portfolio.dns_name}"
  type         = "CNAME"
  ttl          = 300
  managed_zone = google_dns_managed_zone.portfolio.name
  project      = var.project_id
  rrdatas      = ["Sanjeevliv.github.io."]
}

# A record for monitor subdomain (Grafana)
resource "google_dns_record_set" "monitor" {
  name         = "monitor.${google_dns_managed_zone.portfolio.dns_name}"
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.portfolio.name
  project      = var.project_id
  rrdatas      = ["34.47.220.97"]
}
