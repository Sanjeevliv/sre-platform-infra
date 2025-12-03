variable "project_id" {
  description = "The GCP project ID to deploy resources into."
  type        = string
  default     = "sre-portfolio"
}

variable "region" {
  description = "The GCP region to deploy resources into."
  type        = string
  default     = "asia-south1"
}