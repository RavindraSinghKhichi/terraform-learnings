variable "instance_name" {
    type = string
    default = "ec2-instance-dev"
}

variable "instance_type" {
  type = string
  description = "Type of the ec2 instance i want to create"
  default = "t3.micro"
}

