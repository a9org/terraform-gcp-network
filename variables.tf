variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "Region where resources will be created"
  type        = string
  default     = "us-central1"
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "network_name" {
  description = "VPC Network name"
  type        = string
  default     = "main-vpc"
}

variable "subnets" {
  description = "List of subnets to be created"
  type = list(object({
    name          = string
    ip_cidr_range = string
    region        = string
  }))
  default = [
    {
      name          = "subnet-1"
      ip_cidr_range = "10.0.1.0/24"
      region        = "us-central1"
    },
    {
      name          = "subnet-2"
      ip_cidr_range = "10.0.2.0/24"
      region        = "us-central1"
    }
  ]
}