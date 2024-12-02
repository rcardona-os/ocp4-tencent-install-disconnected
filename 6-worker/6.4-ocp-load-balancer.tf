########################################################################################
##########################  Worker Load Balancer Definition  ###########################
########################################################################################

resource "tencentcloud_clb_attachment" "targets_80" {
  clb_id      = data.terraform_remote_state.ocp_infra.outputs.worker_lb_id
  listener_id = data.terraform_remote_state.ocp_infra.outputs.worker_listener_80_id

  targets {
    eni_ip = tencentcloud_private_dns_record.worker_1_a_record.record_value # Replace with actual instance ID
    port        = 80
  }

  targets {
    eni_ip = tencentcloud_private_dns_record.worker_2_a_record.record_value # Replace with actual instance ID
    port        = 80
  }

  targets {
    eni_ip = tencentcloud_private_dns_record.worker_3_a_record.record_value # Replace with actual instance ID
    port        = 80
  }
}

resource "tencentcloud_clb_attachment" "targets_443" {
  clb_id      = data.terraform_remote_state.ocp_infra.outputs.worker_lb_id
  listener_id = data.terraform_remote_state.ocp_infra.outputs.worker_listener_443_id

  targets {
    eni_ip = tencentcloud_private_dns_record.worker_1_a_record.record_value # Replace with actual instance ID
    port        = 443
  }

  targets {
    eni_ip = tencentcloud_private_dns_record.worker_2_a_record.record_value # Replace with actual instance ID
    port        = 443
  }

  targets {
    eni_ip = tencentcloud_private_dns_record.worker_3_a_record.record_value # Replace with actual instance ID
    port        = 443
  }
}