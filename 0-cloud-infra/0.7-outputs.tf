output "vpc_id" {
  value = tencentcloud_vpc.vpc.id
}

output "vpc_cidr" {
  value = var.vpc_cidr
}

output "public_subnet_id" {
  value = tencentcloud_subnet.public_subnet.id
}

output "public_security_group_id" {
  value = tencentcloud_security_group.public_security_group.id
}

output "region" {
  value = var.region
}

output "availability_zone" {
  value = var.availability_zone
}

output "private_domain" {
  value = var.private_domain
}

output "private_zone_id" {
  value = tencentcloud_private_dns_zone.ocp_hosted_private_zone.id
}