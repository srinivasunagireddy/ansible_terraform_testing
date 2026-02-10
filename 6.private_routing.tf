resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.default.id

  #   route {
  #     cidr_block = "0.0.0.0/0"
  #     gateway_id = aws_internet_gateway.igw.id
  #   }
  tags = {
    Name              = "${var.vpc_name}-PRIVATE-RT"
    Terraform-Managed = "Yes"
    environment       = local.new_environment
    ProjectID         = local.projid
  }

}
#VPC Peering Routes are getting recreated when we apply. To overcome this issue Routing Table
#is created with out any routes & routes for igw,peering are created seperatly.
#https://stackoverflow.com/questions/49174421/terraform-route-table-forcing-new-resource-every-apply

# resource "aws_route" "igw_route" {
#   route_table_id         = aws_route_table.public_rt.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.igw.id
# }

resource "aws_route_table_association" "private_rta" {
  count = length(local.new_private_subnet_cidrs)
  #Using * is called Splat Syntax to get multiple subnet ids
  subnet_id      = element(aws_subnet.private_subent.*.id, count.index)
  route_table_id = aws_route_table.private_rt.id
}
