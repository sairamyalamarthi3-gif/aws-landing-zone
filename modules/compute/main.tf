##############################################
# IAM Role for EC2
##############################################

resource "aws_iam_role" "ec2_role" {

  name = "${var.project_name}-${var.environment}-ec2-role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Principal = {

          Service = "ec2.amazonaws.com"

        }

        Action = "sts:AssumeRole"

      }

    ]
  })

  tags = {

    Name        = "${var.project_name}-${var.environment}-ec2-role"
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = var.project_name

  }
}

##############################################
# Attach SSM Managed Policy
##############################################

resource "aws_iam_role_policy_attachment" "ssm" {

  role = aws_iam_role.ec2_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"

}
##############################################
# IAM Instance Profile
##############################################

resource "aws_iam_instance_profile" "ec2_profile" {

  name = "${var.project_name}-${var.environment}-instance-profile"

  role = aws_iam_role.ec2_role.name

}

##############################################
# Launch Template
##############################################

resource "aws_launch_template" "this" {

  name_prefix = "${var.project_name}-${var.environment}-"

  image_id = var.ami_id

  instance_type = var.instance_type

  key_name = var.key_name

  vpc_security_group_ids = [
    var.ec2_security_group_id
  ]

  iam_instance_profile {

    name = aws_iam_instance_profile.ec2_profile.name

  }

  user_data = base64encode(file("${path.module}/user-data.sh"))

  monitoring {

    enabled = true

  }

  tag_specifications {

    resource_type = "instance"

    tags = {

      Name        = "${var.project_name}-${var.environment}-web"
      Environment = var.environment
      ManagedBy   = "Terraform"
      Project     = var.project_name

    }

  }
}
