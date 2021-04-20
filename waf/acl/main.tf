# global
module "acl_global" {
  source                = "./submodule"
  count                 = contains(var.regions, "global") ? 1 : 0
  scope                 = "CLOUDFRONT"
  name                  = var.name
  rate_limit            = var.rate_limit
  rate_limit_action     = var.rate_limit_action
  custom_rule_group_arn = var.custom_rule_group_arn != null ? lookup(var.custom_rule_group_arn, "global", "") : ""
  managed_rules         = var.managed_rules
  whitelisted_ips       = var.whitelisted_ips
  providers = {
    aws = aws.us-east-1
  }
}

# N. Virginia
module "acl_us-east-1" {
  source                = "./submodule"
  count                 = contains(var.regions, "us-east-1") ? 1 : 0
  scope                 = "REGIONAL"
  name                  = var.name
  rate_limit            = var.rate_limit
  rate_limit_action     = var.rate_limit_action
  custom_rule_group_arn = var.custom_rule_group_arn != null ? lookup(var.custom_rule_group_arn, "us-east-1", "") : ""
  managed_rules         = var.managed_rules
  whitelisted_ips       = var.whitelisted_ips
  providers = {
    aws = aws.us-east-1
  }
}

# Ohio
module "acl_us-east-2" {
  source                = "./submodule"
  count                 = contains(var.regions, "us-east-2") ? 1 : 0
  scope                 = "REGIONAL"
  name                  = var.name
  rate_limit            = var.rate_limit
  rate_limit_action     = var.rate_limit_action
  custom_rule_group_arn = var.custom_rule_group_arn != null ? lookup(var.custom_rule_group_arn, "us-east-2", "") : ""
  managed_rules         = var.managed_rules
  whitelisted_ips       = var.whitelisted_ips
  providers = {
    aws = aws.us-east-2
  }
}

# Sao Paulo
module "acl_sa-east-1" {
  source                = "./submodule"
  count                 = contains(var.regions, "sa-east-1") ? 1 : 0
  scope                 = "REGIONAL"
  name                  = var.name
  rate_limit            = var.rate_limit
  rate_limit_action     = var.rate_limit_action
  custom_rule_group_arn = var.custom_rule_group_arn != null ? lookup(var.custom_rule_group_arn, "sa-east-1", "") : ""
  managed_rules         = var.managed_rules
  whitelisted_ips       = var.whitelisted_ips
  providers = {
    aws = aws.sa-east-1
  }
}

# module "acl_af-south-1" {
#   source                = "./submodule"
#   count                 = contains(var.regions, "af-south-1") ? 1 : 0
#   scope                 = "REGIONAL"
#   name                  = var.name
#   rate_limit            = var.rate_limit
#   rate_limit_action     = var.rate_limit_action
#   custom_rule_group_arn = var.custom_rule_group_arn != null ? lookup(var.custom_rule_group_arn, "af-south-1", "") : ""
#   managed_rules         = var.managed_rules
#   whitelisted_ips       = var.whitelisted_ips
#   providers = {
#     aws = aws.af-south-1
#   }
# }

# module "acl_ap-east-1" {
#   source                = "./submodule"
#   count                 = contains(var.regions, "ap-east-1") ? 1 : 0
#   scope                 = "REGIONAL"
#   name                  = var.name
#   rate_limit            = var.rate_limit
#   rate_limit_action     = var.rate_limit_action
#   custom_rule_group_arn = var.custom_rule_group_arn != null ? lookup(var.custom_rule_group_arn, "ap-east-1", "") : ""
#   managed_rules         = var.managed_rules
#   whitelisted_ips       = var.whitelisted_ips
#   providers = {
#     aws = aws.ap-east-1
#   }
# }

module "acl_ap-south-1" {
  source                = "./submodule"
  count                 = contains(var.regions, "ap-south-1") ? 1 : 0
  scope                 = "REGIONAL"
  name                  = var.name
  rate_limit            = var.rate_limit
  rate_limit_action     = var.rate_limit_action
  custom_rule_group_arn = var.custom_rule_group_arn != null ? lookup(var.custom_rule_group_arn, "ap-south-1", "") : ""
  managed_rules         = var.managed_rules
  whitelisted_ips       = var.whitelisted_ips
  providers = {
    aws = aws.ap-south-1
  }
}

module "acl_ap-northeast-3" {
  source                = "./submodule"
  count                 = contains(var.regions, "ap-northeast-3") ? 1 : 0
  scope                 = "REGIONAL"
  name                  = var.name
  rate_limit            = var.rate_limit
  rate_limit_action     = var.rate_limit_action
  custom_rule_group_arn = var.custom_rule_group_arn != null ? lookup(var.custom_rule_group_arn, "ap-northeast-3", "") : ""
  managed_rules         = var.managed_rules
  whitelisted_ips       = var.whitelisted_ips
  providers = {
    aws = aws.ap-northeast-3
  }
}

module "acl_ap-northeast-2" {
  source                = "./submodule"
  count                 = contains(var.regions, "ap-northeast-2") ? 1 : 0
  scope                 = "REGIONAL"
  name                  = var.name
  rate_limit            = var.rate_limit
  rate_limit_action     = var.rate_limit_action
  custom_rule_group_arn = var.custom_rule_group_arn != null ? lookup(var.custom_rule_group_arn, "ap-northeast-2", "") : ""
  managed_rules         = var.managed_rules
  whitelisted_ips       = var.whitelisted_ips
  providers = {
    aws = aws.ap-northeast-2
  }
}

module "acl_ap-southeast-1" {
  source                = "./submodule"
  count                 = contains(var.regions, "ap-southeast-1") ? 1 : 0
  scope                 = "REGIONAL"
  name                  = var.name
  rate_limit            = var.rate_limit
  rate_limit_action     = var.rate_limit_action
  custom_rule_group_arn = var.custom_rule_group_arn != null ? lookup(var.custom_rule_group_arn, "ap-southeast-1", "") : ""
  managed_rules         = var.managed_rules
  whitelisted_ips       = var.whitelisted_ips
  providers = {
    aws = aws.ap-southeast-1
  }
}

module "acl_ap-southeast-2" {
  source                = "./submodule"
  count                 = contains(var.regions, "ap-southeast-2") ? 1 : 0
  scope                 = "REGIONAL"
  name                  = var.name
  rate_limit            = var.rate_limit
  rate_limit_action     = var.rate_limit_action
  custom_rule_group_arn = var.custom_rule_group_arn != null ? lookup(var.custom_rule_group_arn, "ap-southeast-2", "") : ""
  managed_rules         = var.managed_rules
  whitelisted_ips       = var.whitelisted_ips
  providers = {
    aws = aws.ap-southeast-2
  }
}

module "acl_ap-northeast-1" {
  source                = "./submodule"
  count                 = contains(var.regions, "ap-northeast-1") ? 1 : 0
  scope                 = "REGIONAL"
  name                  = var.name
  rate_limit            = var.rate_limit
  rate_limit_action     = var.rate_limit_action
  custom_rule_group_arn = var.custom_rule_group_arn != null ? lookup(var.custom_rule_group_arn, "ap-northeast-1", "") : ""
  managed_rules         = var.managed_rules
  whitelisted_ips       = var.whitelisted_ips
  providers = {
    aws = aws.ap-northeast-1
  }
}

module "acl_ca-central-1" {
  source                = "./submodule"
  count                 = contains(var.regions, "ca-central-1") ? 1 : 0
  scope                 = "REGIONAL"
  name                  = var.name
  rate_limit            = var.rate_limit
  rate_limit_action     = var.rate_limit_action
  custom_rule_group_arn = var.custom_rule_group_arn != null ? lookup(var.custom_rule_group_arn, "ca-central-1", "") : ""
  managed_rules         = var.managed_rules
  whitelisted_ips       = var.whitelisted_ips
  providers = {
    aws = aws.ca-central-1
  }
}

module "acl_eu-central-1" {
  source                = "./submodule"
  count                 = contains(var.regions, "eu-central-1") ? 1 : 0
  scope                 = "REGIONAL"
  name                  = var.name
  rate_limit            = var.rate_limit
  rate_limit_action     = var.rate_limit_action
  custom_rule_group_arn = var.custom_rule_group_arn != null ? lookup(var.custom_rule_group_arn, "eu-central-1", "") : ""
  managed_rules         = var.managed_rules
  whitelisted_ips       = var.whitelisted_ips
  providers = {
    aws = aws.eu-central-1
  }
}

module "acl_eu-west-1" {
  source                = "./submodule"
  count                 = contains(var.regions, "eu-west-1") ? 1 : 0
  scope                 = "REGIONAL"
  name                  = var.name
  rate_limit            = var.rate_limit
  rate_limit_action     = var.rate_limit_action
  custom_rule_group_arn = var.custom_rule_group_arn != null ? lookup(var.custom_rule_group_arn, "eu-west-1", "") : ""
  managed_rules         = var.managed_rules
  whitelisted_ips       = var.whitelisted_ips
  providers = {
    aws = aws.eu-west-1
  }
}

module "acl_eu-west-2" {
  source                = "./submodule"
  count                 = contains(var.regions, "eu-west-2") ? 1 : 0
  scope                 = "REGIONAL"
  name                  = var.name
  rate_limit            = var.rate_limit
  rate_limit_action     = var.rate_limit_action
  custom_rule_group_arn = var.custom_rule_group_arn != null ? lookup(var.custom_rule_group_arn, "eu-west-2", "") : ""
  managed_rules         = var.managed_rules
  whitelisted_ips       = var.whitelisted_ips
  providers = {
    aws = aws.eu-west-2
  }
}

# module "acl_eu-south-1" {
#   source                = "./submodule"
#   count                 = contains(var.regions, "eu-south-1") ? 1 : 0
#   scope                 = "REGIONAL"
#   name                  = var.name
#   rate_limit            = var.rate_limit
#   rate_limit_action     = var.rate_limit_action
#   custom_rule_group_arn = var.custom_rule_group_arn != null ? lookup(var.custom_rule_group_arn, "eu-south-1", "") : ""
#   managed_rules         = var.managed_rules
#   whitelisted_ips       = var.whitelisted_ips
#   providers = {
#     aws = aws.eu-south-1
#   }
# }

module "acl_eu-west-3" {
  source                = "./submodule"
  count                 = contains(var.regions, "eu-west-3") ? 1 : 0
  scope                 = "REGIONAL"
  name                  = var.name
  rate_limit            = var.rate_limit
  rate_limit_action     = var.rate_limit_action
  custom_rule_group_arn = var.custom_rule_group_arn != null ? lookup(var.custom_rule_group_arn, "eu-west-3", "") : ""
  managed_rules         = var.managed_rules
  whitelisted_ips       = var.whitelisted_ips
  providers = {
    aws = aws.eu-west-3
  }
}

module "acl_eu-north-1" {
  source                = "./submodule"
  count                 = contains(var.regions, "eu-north-1") ? 1 : 0
  scope                 = "REGIONAL"
  name                  = var.name
  rate_limit            = var.rate_limit
  rate_limit_action     = var.rate_limit_action
  custom_rule_group_arn = var.custom_rule_group_arn != null ? lookup(var.custom_rule_group_arn, "eu-north-1", "") : ""
  managed_rules         = var.managed_rules
  whitelisted_ips       = var.whitelisted_ips
  providers = {
    aws = aws.eu-north-1
  }
}

# module "acl_me-south-1" {
#   source                = "./submodule"
#   count                 = contains(var.regions, "me-south-1") ? 1 : 0
#   scope                 = "REGIONAL"
#   name                  = var.name
#   rate_limit            = var.rate_limit
#   rate_limit_action     = var.rate_limit_action
#   custom_rule_group_arn = var.custom_rule_group_arn != null ? lookup(var.custom_rule_group_arn, "me-south-1", "") : ""
#   managed_rules         = var.managed_rules
#   whitelisted_ips       = var.whitelisted_ips
#   providers = {
#     aws = aws.me-south-1
#   }
# }