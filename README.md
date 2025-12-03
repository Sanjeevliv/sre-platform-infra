# SRE Platform Infrastructure

This repository contains Terraform configurations to provision a robust and scalable infrastructure on Google Cloud Platform (GCP) for an SRE portfolio project. It sets up a Google Kubernetes Engine (GKE) Autopilot cluster within a custom Virtual Private Cloud (VPC).

## Infrastructure Overview

The Terraform code provisions the following resources:

*   **VPC Network**: A custom VPC named `sre-platform-vpc`.
*   **Subnetwork**: A dedicated subnet `sre-platform-subnet` in the `asia-south1` region with secondary IP ranges for GKE Pods and Services.
*   **GKE Cluster**: An Autopilot GKE cluster named `sre-platform-cluster`. Autopilot manages the underlying infrastructure, adhering to SRE best practices for reduced operational overhead.
*   **State Management**: Terraform state is stored securely in a GCS bucket (e.g., `<your-state-bucket>`).

## Prerequisites

Before you begin, ensure you have the following installed:

*   [Terraform](https://www.terraform.io/downloads.html) (v1.0+)
*   [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) (`gcloud`)

You also need:
*   A Google Cloud Platform project.
*   Appropriate permissions to create VPCs and GKE clusters.

## Getting Started

1.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd sre-platform-infra
    ```

2.  **Initialize Terraform:**
    Initialize the backend and provider plugins.
    ```bash
    terraform init
    ```

3.  **Review the Plan:**
    See what resources will be created.
    ```bash
    terraform plan
    ```

4.  **Apply Configuration:**
    Provision the infrastructure.
    ```bash
    terraform apply
    ```

## Configuration

### Variables

| Name | Description | Default |
|------|-------------|---------|
| `project_id` | The GCP project ID to deploy resources into. | `<your-project-id>` |
| `region` | The GCP region to deploy resources into. | `asia-south1` |

### Outputs

| Name | Description |
|------|-------------|
| `cluster_name` | The name of the created GKE cluster. |
| `cluster_endpoint` | The public IP address of the GKE cluster. |

## Project Structure

```
.
├── gke.tf          # GKE Autopilot cluster definition
├── main.tf         # Terraform backend configuration
├── network.tf      # VPC and Subnet definitions
├── provider.tf     # Google provider configuration
├── variables.tf    # Input variables
└── README.md       # Project documentation
```