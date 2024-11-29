data "terraform_remote_state" "registry" {
  backend = "local"
  config = {
    path = "../1-registry/terraform.tfstate" # Relative path to project-a's state file
  }
}