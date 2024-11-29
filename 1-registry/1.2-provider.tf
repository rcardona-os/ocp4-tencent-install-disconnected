terraform {
  required_providers {
    tencentcloud = {
      source  = "tencentcloudstack/tencentcloud"
      version = "~> 1.0" # Use the latest compatible version
    }
  }
}

# Configure the Tencent Cloud provider
provider "tencentcloud" {
  secret_id  = var.secret_id
  secret_key = var.secret_key
  region     = data.terraform_remote_state.cloud_infra.outputs.region
}