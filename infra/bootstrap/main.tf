provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "tfstate" {
  bucket = "huan-tfstate-backend"

  tags = {
    Name = "Huan Terraform State Bucket"
  }
}

resource "aws_s3_bucket_versioning" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_key_pair" "ssh_key_dev" {
  key_name   = "huan_ssh_key_dev" 
  public_key = file("${path.module}/.ssh/id_ed25519_dev.pub")  

  tags = {
    Name        = "huan_ssh_key_dev"
    Environment = "dev"
    Owner       = "huan-minh-le"
  }
}

resource "aws_key_pair" "ssh_key_prod" {
  key_name   = "huan_ssh_key_prod" 
  public_key = file("${path.module}/.ssh/id_ed25519_prod.pub")  

  tags = {
    Name        = "huan_ssh_key_dev"
    Environment = "prod"
    Owner       = "huan-minh-le"
  }
}


