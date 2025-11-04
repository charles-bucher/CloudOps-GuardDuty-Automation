# ==============================================
# S3 Secure Bucket Module Outputs
# ==============================================

output "bucket_id" {
  description = "ID of the S3 bucket"
  value       = aws_s3_bucket.site.id
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.site.arn
}

output "bucket_domain_name" {
  description = "Domain name of the S3 bucket"
  value       = aws_s3_bucket.site.bucket_domain_name
}

output "bucket_region" {
  description = "AWS region of the S3 bucket"
  value       = aws_s3_bucket.site.region
}
