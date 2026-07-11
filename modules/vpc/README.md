# VPC Module

## Overview

This module provisions a reusable AWS Virtual Private Cloud (VPC) using Terraform.

## Features

- Creates an AWS VPC
- Configurable CIDR block
- DNS Support
- DNS Hostnames
- Standardized resource tagging

## Inputs

| Variable | Description |
|----------|-------------|
| vpc_cidr | CIDR block for the VPC |
| project_name | Project name |
| environment | Deployment environment |

## Outputs

- VPC ID
- VPC CIDR Block
