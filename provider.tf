# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
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
