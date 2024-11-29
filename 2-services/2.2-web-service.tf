
provider "local" {}

# Define the target RHEL 9 node
resource "null_resource" "configure_http_server" {
  connection {
    type        = "ssh"
    host        = data.terraform_remote_state.registry.outputs.registry_public_ip
    user        = var.target_user
    private_key = file(var.private_key)
  }

  provisioner "remote-exec" {
    inline = [
      # Configure web server
      "sudo dnf install -y httpd wget jq || echo 'Packages already installed'",
      "sudo systemctl enable httpd || echo 'Service already enabled'",
      "sudo systemctl start httpd || echo 'Service already started'",
      "echo '<h1> 此主机作为 Red Hat Openshift Cluster v4 安装的网络服务器 </h1>' | sudo tee /var/www/html/index.html",

      # Download yq and set up
      "wget -q https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/local/bin/yq",
      "sudo chmod +x /usr/local/bin/yq",
      "echo 'yq downloaded and installed'",

      # Extract cluster name
      "export CLUSTERNAME=$(yq eval -o=json install-config.yaml | jq -r '.metadata.name')",
      "echo 'Cluster name is $CLUSTERNAME'",

      # Set up ignition files
      "mkdir -p $CLUSTERNAME",
      "cp install-config.yaml $CLUSTERNAME/",
      "$HOME/openshift-install create ignition-configs --dir=$CLUSTERNAME",
      "sudo cp -f $CLUSTERNAME/*.ign /var/www/html/",
      "sudo chmod a+r /var/www/html/*.ign"
    ]
  }
}