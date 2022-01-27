provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "f1f9031de993b5cbb961fd5fd8b6585c61e42bc9"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-01-27 16:22:14"
    git_last_modified_by = "fallen619@hotmail.it"
    git_modifiers        = "fallen619"
    git_org              = "angelo-malatacca"
    git_repo             = "terragoat"
    yor_trace            = "09815f98-2bcd-4590-99b7-29f3c759d6e9"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "f1f9031de993b5cbb961fd5fd8b6585c61e42bc9"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-01-27 16:22:14"
    git_last_modified_by = "fallen619@hotmail.it"
    git_modifiers        = "fallen619"
    git_org              = "angelo-malatacca"
    git_repo             = "terragoat"
    yor_trace            = "d9231d1f-e824-486b-b129-3e4037fceb89"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
