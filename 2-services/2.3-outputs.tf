output "Webserver" {
  value = "Visit this website to check instalation artifacts => http://${data.terraform_remote_state.registry.outputs.registry_public_ip}"
}