output "vpc_id" {
  value = aws_vpc.vpc.id
  
}

output "subnet_id" {
    value = aws_subnet.subnet.id
  
}

output "internet_gateway_id" {
    value = aws_internet_gateway.internet_gateway.id
  
}

output "route_table_id" {
  value = aws_route_table.route_table.id
}

output "network_lb_id" {  
  value = aws_lb.network_lb.arn
  
}

output "KUBERNETES_PUBLIC_ADDRESS" {
  value = aws_lb.network_lb.dns_name 
}


