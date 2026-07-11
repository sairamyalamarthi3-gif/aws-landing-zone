resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_a_cidr
  availability_zone       = var.availability_zone_a
  map_public_ip_on_launch = var.public_subnet_map_public_ip

  tags = {
    Name        = "${var.project_name}-${var.environment}-public-a"
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Tier        = "Public"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_b_cidr
  availability_zone       = var.availability_zone_b
  map_public_ip_on_launch = var.public_subnet_map_public_ip

  tags = {
    Name        = "${var.project_name}-${var.environment}-public-b"
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Tier        = "Public"
  }
}

###################Private Subnet A###############
resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_a_cidr
  availability_zone = var.availability_zone_a

  tags = {
    Name        = "${var.project_name}-${var.environment}-private-a"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = var.project_name
    Tier        = "Private"
  }
}
########Private Subnet B######
resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_b_cidr
  availability_zone = var.availability_zone_b

  tags = {
    Name        = "${var.project_name}-$(var.environment}-private-b"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = var.project_name
    Tier        = "Private"
  }
}
