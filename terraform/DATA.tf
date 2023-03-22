data "aws_vpc" "selected" {
    default = true
}

data "aws_subnets" "pb-subnets" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
    # filter {
    # name = "tag:Name"
    # values = ["default*"]
  # }
}

data "aws_ami" "amazon-linux-2" {
  owners = ["amazon"]
  most_recent = true
  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

data "aws_route53_zone" "selected" {
  name = var.hosted-zone
}

data "template_file" "Terraform-Phonebook-Application-deployed-on-AWS-Project" {
  template = file("user_data.sh")
  vars = {
    user_data-git-token = var.git-token
    user_data-git-name = var.git-name
  }
}