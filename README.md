# SRE Platform Infrastructure (sanjeevsethi.in)

This repository contains the Terraform infrastructure code for my SRE portfolio platform, as defined in my "Mission SRE" plan.

The goal of this code is to provision a production-grade, "Always Free" GKE Autopilot cluster and its supporting VPC network in Google Cloud.

## Phase 1: Platform Foundation

### Progress Log

* [x] **Project:** Created new GCP Project (`your-project-id-here`).
* [x] **Repository:** Initialized `sre-platform-infra` GitHub repository.
* [x] **Local Tooling:** Installed `terraform` CLI via Homebrew.
* [x] **Local Tooling:** Installed `gcloud` SDK via Homebrew.
* [x] **Authentication:** Logged in to GCP using `gcloud auth application-default login`.
* [x] **Remote Backend:** Manually created GCS bucket (`your-bucket-name-here`) in `us-central1` for $0 remote state storage.
* [x] **Terraform Core:** Wrote `main.tf`, `provider.tf`, `variables.tf`.
* [x] **Terraform Init:** Successfully ran `terraform init` to connect to the GCS backend.
* [x] **Terraform Code (Network):** Wrote `network.tf` to define a custom VPC and GKE subnets in `asia-south1`.
* [x] **Terraform Code (Cluster):** Wrote `gke.tf` to define the "Always Free" GKE Autopilot cluster.
* [ ] **Terraform Plan:** Run `terraform plan` to validate the infrastructure changes.
* [ ] **Terraform Apply:** Run `terraform apply` to provision the VPC and GKE cluster.

### Next Steps

1.  Run `terraform init -upgrade` to pull new providers.
2.  Run `terraform plan` to review planned changes.
3.  Run `terraform apply` to deploy.