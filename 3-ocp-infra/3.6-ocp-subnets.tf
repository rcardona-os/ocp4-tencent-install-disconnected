resource "tencentcloud_subnet" "ocp_private_subnet_1" {
  name              = "ocp-private-subnet-1"
  vpc_id            = data.terraform_remote_state.cloud_infra_for_ocp.outputs.vpc.id
  cidr_block        = var.ocp_private_subnet_1_cidr
  availability_zone = var.availability_zone_1
  tags = {
    environment = "openshift"
  }
}

resource "tencentcloud_subnet" "ocp_private_subnet_2" {
  name       = "ocp-private-subnet-2"
  vpc_id     = data.terraform_remote_state.cloud_infra_for_ocp.outputs.vpc.id
  cidr_block = var.ocp_private_subnet_2_cidr
  availability_zone = var.availability_zone_2
  tags = {
    environment = "openshift"
  }
}

resource "tencentcloud_subnet" "ocp_private_subnet_3" {
  name       = "ocp-private-subnet-3"
  vpc_id     = data.terraform_remote_state.cloud_infra_for_ocp.outputs.vpc.id
  cidr_block = var.ocp_private_subnet_3_cidr
  availability_zone = var.availability_zone_3
  tags = {
    environment = "openshift"
  }
}