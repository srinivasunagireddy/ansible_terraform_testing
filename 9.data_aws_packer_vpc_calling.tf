#Used here pakcer vpc already awsalible in aws (i'm calling it as ansible vpc beacuse this packer vpc used )
data "aws_vpc" "ansible_vpc" {
  filter {
    name   = "tag:Name"
    values = ["packer-vpc-vpc"]
  }
}

#Used here pakcer vpc subnet already awsalible in aws 
data "aws_subnets" "ansible_subnets" {

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.ansible_vpc.id]
  }

  tags = {
    Tier = "Public" # Example: Only get subnets tagged with Tier=Private
  }

}

# i have two public packer vpc subnets and calling with array of indiex "0" the element
locals {
  packer_subnet_id = data.aws_subnets.ansible_subnets.ids[0]
}


data "aws_route_table" "ansible_vpc_rt" {
  subnet_id = local.packer_subnet_id
}
