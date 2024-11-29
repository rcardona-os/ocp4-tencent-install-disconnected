data "terraform_remote_state" "cloud_infra_for_ocp" {
  backend = "local"
  config = {
    path = "../0-cloud-infra/terraform.tfstate" # Relative path to project-a's state file
  }
}