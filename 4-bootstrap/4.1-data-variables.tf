data "terraform_remote_state" "ocp_infra" {
  backend = "local"
  config = {
    path = "../3-ocp-infra/terraform.tfstate" # Relative path to project-a's state file
  }
}