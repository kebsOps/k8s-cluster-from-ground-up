resource "aws_lb" "network_lb" {
    name = var.lb_name
    internal = false
    load_balancer_type = "network"
    subnets = [ for subnet in aws_subnet.subnet[*] : subnet.id ]
  
 tags = merge(
    var.common_tags,
    {
      Name = "${var.resource_prefix} network LB"
    },
  )

}