resource "aws_route_table" "route_table" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gateway.id
    }

  tags = {
    Name = var.name
  }
}

resource "aws_main_route_table_association" "route_table" {
  vpc_id = aws_vpc.vpc.id
  route_table_id = aws_route_table.route_table.id
  
}