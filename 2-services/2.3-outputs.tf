output "Webserver" {
  value = "Web service for Openshift installation artifacts => http://${data.terraform_remote_state.registry.outputs.registry_public_ip}"
}