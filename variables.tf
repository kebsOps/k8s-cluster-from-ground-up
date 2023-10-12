variable "region" {
  description = "The AWS region to create instances in"
  type        = string
}

variable "resource_prefix" {
  description = "Common prefix for all resources."
  type        = string
  default     = "k8s-cluster-from-ground-up"
}

variable "common_tags" {
  description = "Common tags for all resources."
  type        = map(string)
  default     = {
    Project = "k8s-cluster-from-ground-up"
    Owner   = "KebsOps"
  }
}

variable "vpc_name" {
  description = "The AWS VPC name"
  type        = string
}

variable "vpc_cidr" {
  description = "The AWS VPC CIDR"
  type        = string
}

