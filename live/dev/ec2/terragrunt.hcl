# This terragrunt.hcl is used to call modules
terraform {
  # Deploy version v0.0.3 in stage
  #give full path always in dir like modules/ec2
  
  source = "git::git@github.com:RavindraSinghKhichi/terraform-learnings.git//modules/ec2?ref=v0.0.5"
}

inputs = {
  instance_name = "ec2-instance-dev"
  instance_type  = "t3.micro"
}

dependency "templates" {
  config_path = "../templates"
}

# When you run terragrunt plan, terragrunt will look here.

