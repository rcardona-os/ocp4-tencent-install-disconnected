########################################################################################
##########################  Master Load Balancer Definition  ###########################
########################################################################################

resource "tencentcloud_lb" "master_lb" {
  name   = "master-lb"
  vpc_id = data.terraform_remote_state.cloud_infra.outputs.vpc_id       
  type   = "INTERNAL"                                                           
}

resource "tencentcloud_clb_listener" "master_listener_6443" {
  clb_id         = tencentcloud_lb.master_lb.id
  protocol       = "TCP"
  port           = 6443
  listener_name  = "listener-6443"
}

resource "tencentcloud_clb_listener" "master_listener_22623" {
  clb_id         = tencentcloud_lb.master_lb.id
  protocol       = "TCP"
  port           = 22623
  listener_name  = "listener-22623"
}

resource "tencentcloud_clb_attachment" "master_targets_6443" {
  clb_id      = tencentcloud_lb.master_lb.id
  listener_id = tencentcloud_clb_listener.master_listener_6443.id

  targets {
    instance_id = "master-0.${var.ocp_cluster_name}.${data.terraform_remote_state.cloud_infra.outputs.private_domain}" # Replace with actual instance ID
    port        = 6443
  }

  targets {
    instance_id = "master-1.${var.ocp_cluster_name}.${data.terraform_remote_state.cloud_infra.outputs.private_domain}" # Replace with actual instance ID
    port        = 6443
  }

  targets {
    instance_id = "master-2.${var.ocp_cluster_name}.${data.terraform_remote_state.cloud_infra.outputs.private_domain}" # Replace with actual instance ID
    port        = 6443
  }
}

resource "tencentcloud_clb_attachment" "master_targets_22623" {
  clb_id      = tencentcloud_lb.master_lb.id
  listener_id = tencentcloud_clb_listener.master_listener_22623.id

  targets {
    instance_id = "master-0.${var.ocp_cluster_name}.${data.terraform_remote_state.cloud_infra.outputs.private_domain}" # Replace with actual instance ID
    port        = 22623
  }

  targets {
    instance_id = "master-1.${var.ocp_cluster_name}.${data.terraform_remote_state.cloud_infra.outputs.private_domain}" # Replace with actual instance ID
    port        = 22623
  }

  targets {
    instance_id = "master-2.${var.ocp_cluster_name}.${data.terraform_remote_state.cloud_infra.outputs.private_domain}" # Replace with actual instance ID
    port        = 22623
  }
}

########################################################################################
##########################  Worker Load Balancer Definition  ###########################
########################################################################################

resource "tencentcloud_lb" "worker_lb" {
  name   = "worker-lb"
  vpc_id = data.terraform_remote_state.cloud_infra.outputs.vpc_id       
  type   = "INTERNAL"                                                           
}

resource "tencentcloud_clb_listener" "worker_listener_80" {
  clb_id         = tencentcloud_lb.worker_lb.id
  protocol       = "TCP"
  port           = 80
  listener_name  = "listener-80"
}

resource "tencentcloud_clb_listener" "worker_listener_443" {
  clb_id         = tencentcloud_lb.worker_lb.id
  protocol       = "TCP"
  port           = 443
  listener_name  = "listener-443"
}

resource "tencentcloud_clb_attachment" "worker_targets_80" {
  clb_id      = tencentcloud_lb.worker_lb.id
  listener_id = tencentcloud_clb_listener.worker_listener_80.id

  targets {
    instance_id = "worker-0.${var.ocp_cluster_name}.${data.terraform_remote_state.cloud_infra.outputs.private_domain}" # Replace with actual instance ID
    port        = 80
  }

  targets {
    instance_id = "worker-1.${var.ocp_cluster_name}.${data.terraform_remote_state.cloud_infra.outputs.private_domain}" # Replace with actual instance ID
    port        = 80
  }

  targets {
    instance_id = "worker-2.${var.ocp_cluster_name}.${data.terraform_remote_state.cloud_infra.outputs.private_domain}" # Replace with actual instance ID
    port        = 80
  }
}

resource "tencentcloud_clb_attachment" "worker_targets_443" {
  clb_id      = tencentcloud_lb.worker_lb.id
  listener_id = tencentcloud_clb_listener.worker_listener_443.id

  targets {
    instance_id = "worker-0.${var.ocp_cluster_name}.${data.terraform_remote_state.cloud_infra.outputs.private_domain}" # Replace with actual instance ID
    port        = 443
  }

  targets {
    instance_id = "worker-1.${var.ocp_cluster_name}.${data.terraform_remote_state.cloud_infra.outputs.private_domain}" # Replace with actual instance ID
    port        = 443
  }

  targets {
    instance_id = "worker-2.${var.ocp_cluster_name}.${data.terraform_remote_state.cloud_infra.outputs.private_domain}" # Replace with actual instance ID
    port        = 443
  }
}