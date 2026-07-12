variable "project-name" {
  description = "Project Name"
  type        = string
}

variable "environment" {
  description = "Deployment Environment"
  type        = string

}

variable "private_subnets" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "ec2_security_group_id" {
  description = "EC2 Security Group ID"
  type        = string
}

variable "target-group_arn" {
  description = "Target Group ARN"
  type        = string
}

variable "instance_type" {
  description = "Ec2 Instance Type"
  type        = string
  default     = "t2.micro"
}

variable "desired_capacity" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 2
}

variable "max_size" {
  type    = number
  default = 4

}

variable "ami_id" {
  description = "Amazon Linux 2023 AMI"
  type        = string
}

variable "key_name" {
  description = "EC2 Key Pair"
  type        = string
}
