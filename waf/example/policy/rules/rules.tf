# global
module "geo-rule-group_global" {
  source = "./modules/geo-rule-group"
  scope  = "CLOUDFRONT"
  countries = var.countries
  providers = {
    aws = aws.us-east-1
  }
}

# N. Virginia
module "geo-rule-group_us-east-1" {
  source = "./modules/geo-rule-group"
  scope  = "REGIONAL"
  countries = var.countries
  providers = {
    aws = aws.us-east-1
  }
}