resource "aws_lb_target_group" "target_group" { 
    name = "k8-cluster"
    port = 6443
    protocol = "TCP"
    vpc_id = aws_vpc.vpc.id
    target_type = "ip"

     health_check {
    interval = 30
    port = 6443
    protocol = "TCP"
  }
}

resource "aws_lb_target_group_attachment" "lb_tg_attach" {
    count = 3
    target_group_arn = aws_lb_target_group.target_group.arn
    target_id = "172.31.0.1${count.index}"
    port = 6443  
}

resource "aws_lb_listener" "listener" {
    load_balancer_arn = aws_lb.network_lb.arn
    port = "6443"
    protocol = "TCP"

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.target_group.arn
    }
  
}