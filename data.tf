data "aws_ami" "this" {
  owners      = var.ami_owner
  most_recent = true
  filter {
    name   = "name"
    values = var.ami_filter
  }
}

data "aws_vpc" "this" {
  default = true
}
