terraform {
  backend "s3" {
    bucket = "khabib12"
    key    = "khabib-terraform-learn.prod"
    region = "us-east-1"
    encrypt = true
  }
}
