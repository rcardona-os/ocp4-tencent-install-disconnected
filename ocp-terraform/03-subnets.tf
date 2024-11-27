resource "tencentcloud_subnet" "ocp_public_subnet" {
  name       = "ocp-public-subnet"
  vpc_id     = tencentcloud_vpc.ocp_vpc.id
  cidr_block = var.public_subnet_cidr
  availability_zone = "eu-frankfurt-1"
  tags = {
    environment = "openshift"
  }
}