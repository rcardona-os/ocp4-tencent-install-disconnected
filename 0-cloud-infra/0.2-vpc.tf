
resource "tencentcloud_vpc" "vpc" {
  name       = "vpc"
  cidr_block = var.vpc_cidr
  tags = {
    environment = "openshift"
  }
}