# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket  = "khabib12"
    encrypt = true
    key     = "./terraform.tfstate"
    region  = "us-east-1"
  }
}
