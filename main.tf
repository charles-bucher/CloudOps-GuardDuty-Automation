module "secure_bucket" {
  source = "./modules/s3_secure"
  name   = var.name
}