data "aws_caller_identity" "current" {}

# The above function call the AWS STS API ,Returns:Account ID,User/role ARN,User ID
# example returened values account_id = "211125710812", arn        = "arn:aws:iam::211125710812:user/devops"

data "aws_ami" "my_ami" {

  most_recent = true
  name_regex  = "^DevSecOps"
  owners      = [data.aws_caller_identity.current.account_id]
  #owners     = "211125710812"

}


resource "aws_instance" "webserver" {

  count                       = 3
  ami                         = data.aws_ami.my_ami.id
  instance_type               = lookup(var.instance_type, local.new_environment)
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.public_subent.*.id, count.index)
  vpc_security_group_ids      = [aws_security_group.allow_all.id]
  associate_public_ip_address = true

  tags = {
    Name              = "${var.vpc_name}-PublicServer-${count.index + 1}"
    Terraform-Managed = "Yes"
    Env               = local.new_environment
    ProjectID         = local.projid
    ManagedBy         = "Terraform"
  }


}
