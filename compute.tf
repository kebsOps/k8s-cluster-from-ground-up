data "aws_ami" "latest-ubuntu-linux-image" {
     most_recent = true
    owners = ["099720109477"]
    filter{
        name="name"
        values=["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-*"]
    }

    filter {
      name = "architecture"
      values = ["x86_64"]
    }
    filter{
        name="virtualization-type"
        values=["hvm"]
  }

}

resource "aws_instance" "master_node" {
    count   = 3
    ami     = data.aws_ami.latest-ubuntu-linux-image.id
    instance_type = var.instance_type
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.sg.id]
    key_name = var.key_name
    subnet_id = aws_subnet.subnet.id
    private_ip = "172.31.0.1${count.index}"
    source_dest_check = false
    user_data = <<EOF
    #!/bin/bash
    name="master-${count.index}"
  EOF


  tags = {
    Name = "${var.name}-master-${count.index}"
  }
}

resource "aws_instance" "worker_node" {
    count = 3
    ami = data.aws_ami.latest-ubuntu-linux-image.id
    instance_type = var.instance_type
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.sg.id]
    key_name = var.key_name
    subnet_id = aws_subnet.subnet.id
    private_ip = "172.31.0.2${count.index}"
    source_dest_check = false
    user_data = <<-EOF
    #!/bin/bash
    name="worker-${count.index}"
    # Set pod CIDR if needed, otherwise remove or comment out the next line
    pod_cidr="172.20.${count.index}.0/24"
  EOF


  tags = {
    Name = "${var.name}-worker-${count.index}"
  }
}

