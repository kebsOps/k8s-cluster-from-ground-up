variable "region" {
  description = "The AWS region to create instances in"
  type        = string
}

variable "resource_prefix" {
  description = "Common prefix for all resources"
  type        = string
  default     = "k8s-cluster-from-ground-up"
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {
    Project = "k8s-cluster-from-ground-up"
    Owner   = "KebsOps"
  }
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

variable "lb_tg_attach" {
  description = "target group attachment"
  type =  string   
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