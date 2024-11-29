#########################################################################################
#########################  Bootstrap Load Balancer Definition  ##########################
#########################################################################################

resource "tencentcloud_clb_attachment" "bootstrap_targets_6443" {
  clb_id      = data.terraform_remote_state.ocp_infra.outputs.master_lb_id
  listener_id = data.terraform_remote_state.ocp_infra.outputs.master_listener_6443_id

  targets {
    eni_ip = tencentcloud_private_dns_record.bootstrap_a_record.record_value
    port   = 6443 
  }
}

resource "tencentcloud_clb_attachment" "bootstrap_targets_22623" {
  clb_id      = data.terraform_remote_state.ocp_infra.outputs.master_lb_id
  listener_id = data.terraform_remote_state.ocp_infra.outputs.master_listener_22623_id

  targets {
    eni_ip = tencentcloud_private_dns_record.bootstrap_a_record.record_value
    port   = 22623
  }
}