########################################################################################
##########################  Master Load Balancer Definition  ###########################
########################################################################################

resource "tencentcloud_clb_attachment" "targets_6443" {
  clb_id      = data.terraform_remote_state.ocp_infra.outputs.master_lb_id
  listener_id = data.terraform_remote_state.ocp_infra.outputs.master_listener_6443_id

  targets {
    eni_ip = tencentcloud_private_dns_record.master_1_a_record.record_value
    port        = 6443
  }

  targets {
    eni_ip = tencentcloud_private_dns_record.master_2_a_record.record_value
    port        = 6443
  }

  targets {
    eni_ip = tencentcloud_private_dns_record.master_3_a_record.record_value
    port        = 6443
  }
}

resource "tencentcloud_clb_attachment" "targets_22623" {
  clb_id      = data.terraform_remote_state.ocp_infra.outputs.master_lb_id
  listener_id = data.terraform_remote_state.ocp_infra.outputs.master_listener_22623_id

  targets {
    eni_ip = tencentcloud_private_dns_record.master_1_a_record.record_value
    port        = 22623
  }

  targets {
    eni_ip = tencentcloud_private_dns_record.master_2_a_record.record_value
    port        = 22623
  }

  targets {
    eni_ip = tencentcloud_private_dns_record.master_3_a_record.record_value
    port        = 22623
  }
}