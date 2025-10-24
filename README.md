# SRE Platform Infrastructure (sanjeevsethi.in)

## Phase 1: Platform Foundation

### Progress Log

* [x] **Project:** Created new GCP Project (`sre-portfolio-project`).
* [x] **Repository:** Initialized `sre-platform-infra` GitHub repository.
* [x] **Local Tooling:** Installed `terraform` CLI via Homebrew.
* [x] **Local Tooling:** Installed `gcloud` SDK via Homebrew.
* [x] **Authentication:** Logged in to GCP using `gcloud auth application-default login`.
* [x] **Remote Backend:** Manually created GCS bucket (`sanjeev-sre-tf-state`) in `asia-south1 (Mumbai)` for $0.1 remote state storage.
* [x] **Terraform Core:** Wrote `main.tf`, `provider.tf`, `variables.tf`.
* [x] **Terraform Init:** Successfully ran `terraform init` to connect to the GCS backend.
* [x] **Terraform Code (Network):** Wrote `network.tf` to define a custom VPC and GKE subnets in `asia-south1`.
* [x] **Terraform Code (Cluster):** Wrote `gke.tf` to define the "Always Free" GKE Autopilot cluster.
* [x] **Terraform Plan:** Run `terraform plan` to validate the infrastructure changes.
* [x] **Terraform Apply:** Run `terraform apply` to provision the VPC and GKE cluster.
* [x] **Authentication (kubectl):** Installed `gke-gcloud-auth-plugin`.
* [x] **Cluster Connection:** Ran `gcloud container clusters get-credentials` to generate a `kubeconfig` file.
* [x] **Cluster Validation:** Ran `kubectl get nodes`. Received `No resources found`, confirming the serverless Autopilot cluster is ready and waiting for a workload.