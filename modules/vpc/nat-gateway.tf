###############################
##ELastic Ip for NAT Gateway
########################

resource "aws_eip" "nat" {

  domain = "vpc"

  tags = {
    Name        = "${var.project_name}-{var.environment}-nat-eip"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = var.project_name
  }
}
######################
### NAT Gateway
#####################

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name        = "${var.project_name}-{var.environment}-nat"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = var.project_name
  }

  depends_on = [
    aws_internet_gateway.this
  ]
}
