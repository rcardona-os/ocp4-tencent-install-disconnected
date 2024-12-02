
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
      # Installing web server
      "sudo dnf install -y httpd wget jq || echo 'Packages already installed'",
      
      # Configure web server
      "sudo sed -i 's/^Listen 80$/Listen 8080/' /etc/httpd/conf/httpd.conf",
      "echo '<h1> 此主机作为 Red Hat Openshift Cluster v4 安装的网络服务器 </h1>' | sudo tee /var/www/html/index.html",
      "sudo bash -c 'echo \"<Directory /var/www/html>\" >> /etc/httpd/conf/httpd.conf'",
      "sudo bash -c 'echo \"    Options Indexes FollowSymLinks\" >> /etc/httpd/conf/httpd.conf'",
      "sudo bash -c 'echo \"    AllowOverride None\" >> /etc/httpd/conf/httpd.conf'",
      "sudo bash -c 'echo \"    Require all granted\" >> /etc/httpd/conf/httpd.conf'",
      "sudo bash -c 'echo \"</Directory>\" >> /etc/httpd/conf/httpd.conf'",

      # Starting Web Server
      "sudo systemctl enable httpd || echo 'Service already enabled'",
      "sudo systemctl start httpd || echo 'Service already started'",

      # Download yq and set up
      "wget -q https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O yq",
      "sudo mv yq /usr/local/bin/",
      "sudo chmod +x /usr/local/bin/yq",
      "echo 'yq downloaded and installed'",

      # Extract cluster name
      "export CLUSTERNAME=$(yq eval -o=json install-config.yaml | jq -r '.metadata.name')",

      # Set up ignition files
      "mkdir -p $CLUSTERNAME",
      "cp install-config.yaml $CLUSTERNAME/",
      "$HOME/openshift-install create ignition-configs --dir=$CLUSTERNAME --log-level debug",
      "sudo cp -f $CLUSTERNAME/*.ign /var/www/html/",
      "sudo chmod a+r /var/www/html/*.ign"
    ]
  }
}