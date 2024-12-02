########################################################################################
##########################  Master Load Balancer Definition  ###########################
########################################################################################

resource "tencentcloud_clb_instance" "master_lb" {
  clb_name     = "master-lb"
  vpc_id       = data.terraform_remote_state.cloud_infra.outputs.vpc_id       
  network_type = "INTERNAL"
  vip          = tencentcloud_private_dns_record.api_server_a_record.record_value
  subnet_id    = tencentcloud_subnet.ocp_private_subnet_1.id                             
}

resource "tencentcloud_clb_listener" "master_listener_6443" {
  clb_id         = tencentcloud_clb_instance.master_lb.id
  protocol       = "TCP"
  port           = 6443
  listener_name  = "listener-6443"
}

resource "tencentcloud_clb_listener" "master_listener_22623" {
  clb_id         = tencentcloud_clb_instance.master_lb.id
  protocol       = "TCP"
  port           = 22623
  listener_name  = "listener-22623"
}

########################################################################################
##########################  Worker Load Balancer Definition  ###########################
########################################################################################

resource "tencentcloud_clb_instance" "worker_lb" {
  clb_name     = "worker-lb"
  vpc_id       = data.terraform_remote_state.cloud_infra.outputs.vpc_id       
  network_type = "INTERNAL"
  vip          = tencentcloud_private_dns_record.app_ingress_a_record.record_value
  subnet_id    = tencentcloud_subnet.ocp_private_subnet_1.id                                                        
}

resource "tencentcloud_clb_listener" "worker_listener_80" {
  clb_id         = tencentcloud_clb_instance.worker_lb.id
  protocol       = "TCP"
  port           = 80
  listener_name  = "listener-80"
}

resource "tencentcloud_clb_listener" "worker_listener_443" {
  clb_id         = tencentcloud_clb_instance.worker_lb.id
  protocol       = "TCP"
  port           = 443
  listener_name  = "listener-443"
}