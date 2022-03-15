#HCL Below
#Block type is written at the beggining 
# block type can be resource, data, output, variable, module etc.
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "template_file" "init" {
  template = "${file("${path.module}/init.tpl")}"
  vars = {
    consul_address = "10.0.0.1"
    name = "Khabib"
  }
}


resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDcVBLT1eiApZbzYYsa2Lv1APXF/450sH276lrMNiIkltXRVvGZgAoMlK8QfNHxJbsy7ukqIxuGp8m/mpKe66GmgAORywM2kPf+D0bb6TS1YwoWN3/IXa13tPHUuzc+omnsH8Ix5vh5w52K15vtUbhSNqg4BpHlCTZ9RWhecOPJ8JaCZ8vn5cWjPi3jqfOfmsGX6K/shOsspVWPvGmSj8wJptxtFF4lfDDfChiHODqX1LYSdwYTE7mr20ABWjPbzh5hKI/1x/N/XwYu2zV0meI1fnxpz3wJ8cizE2oB3gGtDz7YZ00GC0Lg5iT5ZCeXEEDalKFX9/zKiN/o2JQZb7x8/itOY56aZJbogeuTujHGwz79HE8Ztclgzzw4iwnV9wOxG8cOhx8tT1/rLRNj+m0gpifrOULo9KsR3jEhDNq0kQgScRyJC+IMb414IWIGr/FAwrxrUXGKVyRRItPkROSmVjsnVsLe1wIFCPPGYC+iyOztbvRw1FtTXwpq1fHlrO0= ravindrasingh@Ravindras-MBP"
}


resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = aws_key_pair.deployer.key_name
  tags = {
    Name = var.instance_name
  }

  user_data = "${data.template_file.init.rendered}"
}



