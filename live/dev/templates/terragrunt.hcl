terraform {
  # Deploy version v0.0.3 in stage
  #give full path always in dir like modules/ec2
  
  source = "git::git@github.com:RavindraSinghKhichi/terraform-learnings.git//templates?ref=v0.0.5"
}