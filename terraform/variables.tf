variable "aws_region" {
  description = "AWS Region where resources will be deployed"
  type        = string
  default     = "eu-west-2"
}

variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR Block for the VPC"
  type        = string
}

variable "availability_zone_a" {
  description = "Primary Availability ZOne A"
  type        = string
}

variable "availability_zone_b" {
  description = "Secondary Availability Zone B"
  type        = string
}

variable "public_subnet_a_cidr" {
  type = string
}

variable "public_subnet_b_cidr" {
  type = string
}

variable "private_subnet_a_cidr" {
  type = string
}

variable "private_subnet_b_cidr" {
  type = string
}
