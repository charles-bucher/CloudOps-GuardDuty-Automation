output "bucket_id" {
  value       = aws_s3_bucket.site.id
  description = "The ID of the created S3 bucket"
}