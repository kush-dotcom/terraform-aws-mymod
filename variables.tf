//Note these variables are for module.tf file (childmod which is the child module)

variable "ami_owner" {
    default = ["099720109477"]
}

variable "ami_filter" {
  default = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
}

variable "group_rules" {  //We are defining variables as MAP OF OBJECTS so we are giving , after every objects
    default = {
    ssh = {
      direction = "ingress" //Taking this as string as we need to print it
      f_port    = 22
      protocol  = "tcp"
      cidr      = "192.168.29.86/32"
    },
    http = {
      direction = "ingress"
      f_port    = 80
      protocol  = "-1"
      cidr      = "0.0.0.0/0"
    },
    https = {
      direction = "ingress"
      f_port    = 443
      protocol  = "tcp"
      cidr      = "0.0.0.0/0"
    },
    all = {
      direction = "egress"
      f_port    = 0
      to_port   = 65535
      protocol  = "-1"
      cidr      = "0.0.0.0/0"
    }
  }
}

variable "sg_name" {
  default = "mysg"
}

variable "ssh_key_name" {
  default = "mykey"
}

variable "ssh_key_path" {
  default = null //As inside module function(file) can't be used so replacing it with null file("./.ssh/aws.pub") /
}

variable "instance_type" {
  default = "t2.micro"
}
