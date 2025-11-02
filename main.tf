module "secure_bucket" {
  source = "./modules/s3-secure"
  name   = var.name
}