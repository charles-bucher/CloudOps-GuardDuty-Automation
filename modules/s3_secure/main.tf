resource "aws_s3_bucket" "site" {
  bucket = var.name
}

resource "aws_s3_bucket_acl" "site_acl" {
  bucket = aws_s3_bucket.site.id
  acl    = "private"
}