resource "aws_security_group" "main" {
  name   = var.sg_name
  vpc_id = data.aws_vpc.this.id
}

resource "aws_security_group_rule" "main" {
  for_each          = var.group_rules 
  type              = each.value.direction
  from_port         = each.value.f_port
  to_port           = each.value.f_port
  protocol          = each.value.protocol
  cidr_blocks       = [each.value.cidr] //It will always come in LIST
  security_group_id = aws_security_group.main.id
}

resource "aws_key_pair" "sre" {
  key_name   = var.ssh_key_name
  public_key = var.ssh_key_path
}

resource "aws_instance" "this" {
  ami             = data.aws_ami.this.id
  instance_type   = var.instance_type
  key_name        = aws_key_pair.sre.key_name
  security_groups = [aws_security_group.main.name]
}
