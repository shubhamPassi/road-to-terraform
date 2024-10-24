resource "aws_s3_bucket" "terraform_state" {
  bucket = "shubham-statefile"

  tags = {
    Name        = "shubham-statefile"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption_config" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "LockID"
  name             = "state-lock-file"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "state-lock-file"
    Environment = "dev"
  }
}
