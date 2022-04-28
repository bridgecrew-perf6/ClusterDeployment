resource "aws_s3_bucket" "s3" {
  bucket = "rev-team-aqua-bubble-bucket"

  tags = {
    Name        = "rev-team-aqua-bubble-bucket"
    Environment = "Prod"
  }
}

resource "aws_s3_bucket_acl" "rev-team-aqua-bubble-bucket" {
  bucket = aws_s3_bucket.s3.id
  acl    = "public-read"
}