
resource "tencentcloud_vpc" "ocp_vpc" {
  name       = "ocp-vpc"
  cidr_block = var.vpc_cidr
  tags = {
    environment = "openshift"
  }
}