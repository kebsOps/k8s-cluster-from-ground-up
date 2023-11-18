variable "region" {
  description = "The AWS region to create instances in"
  type        = string
}


variable "name" {
  type = string
  
}


variable "vpc_cidr" {
  description = "The AWS VPC CIDR"
  type        = string
}

variable "subnet_cidr" {
  description = "The AWS subnet CIDR"
  type =  string
}



variable "sg_name" {
  description = "security group"
  type = string
  
}

variable "lb_name" {
  description = "network load balancer"
  type = string
  
}

variable "tg_name" {
  description = "target group"
  type = string
  
}



variable "key_name" {
  description = "The name of the key pair"
  type = string
}

variable "instance_type" {
  description = "instance type"
  type = string
}

variable "ami" {
  type = string
}