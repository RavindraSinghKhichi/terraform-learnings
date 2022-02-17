terraform {
  # Deploy version v0.0.3 in stage
  source = "git::git@github.com:RavindraSinghKhichi/terraform-learnings.git//ec2?ref=v0.0.1"
}

inputs = {
  instance_name = "ec2-instance-dev"
  instance_type  = "t3.micro"
}