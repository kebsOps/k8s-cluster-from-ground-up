output "vpc_name" {
  value       = aws_vpc.vpc.tags["Name"]
  description = "The name tag of the VPC"
}