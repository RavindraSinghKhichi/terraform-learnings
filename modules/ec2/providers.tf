#Step 1: which provider to download
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" #short hand to registry.terraform.io/hashicorp/aws
      version = "4.0.0"
    }
  }
}

#Step 2: configure the provider 
provider "aws" {
  # Configuration options
  profile = "terraform-profile"
  region  = "us-east-1"
}


#Step 3: terraform fmt
#Step 4: terraform validate
#Step 3: terraform init 