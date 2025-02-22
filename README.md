# GCP Network Infrastructure Terraform Module

This Terraform module automates the creation of network infrastructure within your Google Cloud Platform (GCP) project, providing a solid foundation for your cloud resources with VPC, subnets, and firewall rules.

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Variables](#variables)
- [Outputs](#outputs)
- [Usage](#usage)
    - [Module Example](#module-example)
    - [Standalone Usage](#standalone-usage)
- [License](#license)

## Overview

This module offers an efficient and reliable way to provision basic network infrastructure, customizable through variables to meet your specific needs. Key features include:

- **VPC Network:** Creates a custom Virtual Private Cloud network
- **Subnet Management:** Configurable subnet creation across regions
- **Firewall Rules:** Pre-configured rules for common use cases (HTTP/HTTPS, SSH, internal traffic)
- **Cloud NAT:** Automated setup of Cloud NAT for internet egress from private instances

## Architecture

This module creates the following resources in GCP:

- **VPC Network:** Custom Virtual Private Cloud network
- **Subnets:** Configurable subnet creation in specified regions
- **Firewall Rules:**
  - HTTP/HTTPS (ports 80/443) ingress
  - SSH (port 22) ingress
  - Internal network communication
- **Cloud NAT:** NAT gateway for internet access from private instances
- **Cloud Router:** Required for Cloud NAT functionality

## Prerequisites

Before using this module, ensure you have:

- **Google Cloud Account:** An active account on the Google Cloud Platform
- **Terraform:** Terraform installed and configured on your machine
- **Google Cloud Provider for Terraform:** Google Cloud provider installed and configured correctly
- **GCP Project:** An existing GCP project with billing enabled

## Variables

### Required Variables

| Name | Description | Type | Required |
|------|-------------|------|----------|
| project_id | GCP Project ID | string | yes |
| region | Region where resources will be created | string | no |
| environment | Environment (dev, staging, prod) | string | no |
| network_name | VPC Network name | string | no |
| subnets | List of subnets to be created | list(object) | no |

### Subnet Object Structure

```hcl
subnets = [
  {
    name          = string
    ip_cidr_range = string
    region        = string
  }
]
```

## Outputs

| Name | Description |
|------|-------------|
| vpc_id | The ID of the created VPC |
| vpc_name | The name of the VPC |
| subnet_ids | The IDs of the created subnets |
| nat_ip | NAT Gateway IP address |

## Usage

### Module Example

```hcl
module "network" {
  source = "./modules/network"

  project_id   = "your-project-id"
  region       = "us-central1"
  environment  = "dev"
  network_name = "my-vpc"
  
  subnets = [
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
```

### Standalone Usage

1. **Create Module Directory**

```bash
mkdir -p modules/network
cd modules/network
```

2. **Copy Module Files**

Create the following files in your module directory:
- `main.tf`
- `variables.tf`
- `outputs.tf`

3. **Initialize Terraform**

```bash
terraform init
```

4. **Configure Variables**

Create a `terraform.tfvars` file:

```hcl
project_id   = "your-project-id"
region       = "us-central1"
environment  = "dev"
network_name = "my-vpc"

subnets = [
  {
    name          = "subnet-1"
    ip_cidr_range = "10.0.1.0/24"
    region        = "us-central1"
  }
]
```

5. **Apply Configuration**

```bash
terraform plan
terraform apply
```

To destroy the infrastructure:

```bash
terraform destroy
```

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

## Author

- **Leonardo Issamu** - Initial work and Terraform configuration.