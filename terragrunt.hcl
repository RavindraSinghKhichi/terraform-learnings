# This root level terragrunt.hcl provides definition for Remote state and provider

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = "khabib12"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
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
EOF
}