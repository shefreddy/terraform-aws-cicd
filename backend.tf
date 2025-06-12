terraform {
  backend "s3" {
    bucket = "terraformstatefile01-sf"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}
