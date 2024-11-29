resource "tencentcloud_subnet" "public_subnet" {
  name       = "ocp-public-subnet"
  vpc_id     = tencentcloud_vpc.vpc.id
  cidr_block = var.public_subnet_cidr
  availability_zone = var.availability_zone
  tags = {
    environment = "openshift"
  }
}