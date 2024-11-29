data "terraform_remote_state" "cloud_infra" {
  backend = "local"
  config = {
    path = "../0-cloud-infra/terraform.tfstate" # Relative path to project-a's state file
  }
}