resource "random_pet" "bucket_name" {
  length = 3
  separator = "-"
  prefix = "shubhamp"
}

resource "aws_s3_bucket" "s3_test_bucket" {
  bucket = random_pet.bucket_name.id
  tags = {
    Name = "shubham bucket"
  }
}

resource "random_string" "s3_ob" {
  count = 4
  length = 2
  lower = true
  special = false
}

resource "aws_s3_object" "aws_s3_object" {
  count = 4
  bucket = aws_s3_bucket.s3_test_bucket.id
  key = "${aws_s3_bucket.s3_test_bucket.id}-${random_string.s3_ob[count.index].id}.txt"
  content = "This is a test data for object #${count.index}"
  content_type = "text/plain"
}