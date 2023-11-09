resource "aws_route_table" "route_table" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gateway.id
    }

    tags = merge(
    var.common_tags,
    {
      Name = "${var.resource_prefix} route table"
    },
  )
}

resource "aws_main_route_table_association" "route_table" {
  vpc_id = aws_vpc.vpc.id
  route_table_id = aws_route_table.route_table.id
  
}