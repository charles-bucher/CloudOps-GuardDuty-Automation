output "bucket_id" {
  value       = module.secure_bucket.bucket_id
  description = "The ID of the GuardDuty findings S3 bucket"
}
