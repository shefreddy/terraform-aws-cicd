resource "aws_s3_bucket" "terraform_state" {
  bucket        = "terraformstatefile01-sf"
  force_destroy = false
  tags = {
    Name = "Terraform State Bucket"
  }
}

resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}
