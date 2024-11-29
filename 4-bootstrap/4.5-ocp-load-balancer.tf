#########################################################################################
#########################  Bootstrap Load Balancer Definition  ##########################
#########################################################################################

resource "tencentcloud_lb" "bootstrap_lb" {
  name   = "bootstrap-lb"
  vpc_id = data.terraform_remote_state.cloud_infra_for_ocp.outputs.vpc_id       
  type   = "INTERNAL"                                                           
}

resource "tencentcloud_clb_listener" "listener_6443" {
  clb_id         = tencentcloud_lb.bootstrap_lb.id
  protocol       = "TCP"
  port           = 6443
  listener_name  = "listener-6443"
}

resource "tencentcloud_clb_listener" "listener_22623" {
  clb_id         = tencentcloud_lb.bootstrap_lb.id
  protocol       = "TCP"
  port           = 22623
  listener_name  = "listener-22623"
}

resource "tencentcloud_clb_attachment" "targets_6443" {
  clb_id      = tencentcloud_lb.bootstrap_lb.id
  listener_id = tencentcloud_clb_listener.listener_6443.id

  targets {
    instance_id = "bootstrap-0.${var.ocp_cluster_name}.${data.terraform_remote_state.cloud_infra_for_ocp.outputs.private_domain}" # Replace with actual instance ID
    port        = 6443
  }
}

resource "tencentcloud_clb_attachment" "targets_22623" {
  clb_id      = tencentcloud_lb.bootstrap_lb.id
  listener_id = tencentcloud_clb_listener.listener_22623.id

  targets {
    instance_id = "bootstrap-0.${var.ocp_cluster_name}.${data.terraform_remote_state.cloud_infra_for_ocp.outputs.private_domain}" # Replace with actual instance ID
    port        = 22623
  }
}

