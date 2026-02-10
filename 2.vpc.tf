resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name              = var.vpc_name
    Owner             = "Srinivasu Nagireddy"
    environment       = local.new_environment
    Terraform-managed = "yes"
    projid            = local.projid

  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name              = "${var.vpc_name}-igw"
    Owner             = "Srinivasu Nagireddy"
    environment       = local.new_environment
    Terraform-managed = "yes"
    projid            = local.projid

  }

}
