output "vpc_id" {
  description = "The ID of the created VPC"
  value       = google_compute_network.vpc.id
}

output "vpc_name" {
  description = "The name of the VPC"
  value       = google_compute_network.vpc.name
}

output "vpc_self_link" {
  description = "VPC Self Link"
  value       = google_compute_network.vpc.self_link
}

output "subnet_ids" {
  description = "The IDs of the created subnets"
  value       = { for subnet in google_compute_subnetwork.subnets : subnet.name => subnet.id }
}

output "subnets_public_self_link" {
  description = "Public Subnets Self Link"
  value       = { for subnet in google_compute_subnetwork.subnets : subnet.name => subnet.self_link }
}

output "nat_ip" {
  description = "NAT Gateway IP address"
  value       = google_compute_router_nat.nat.nat_ips
}