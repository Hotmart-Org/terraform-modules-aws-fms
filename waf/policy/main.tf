# Global
module "policy_global" {
  source                = "./submodule"
  count                 = contains(var.regions, "global") ? 1 : 0
  policy_name           = var.policy_name
  scope                 = "CLOUDFRONT"
  managed_rules         = var.managed_rules
  rule_groups           = lookup(var.rule_groups, "global", [])
  accounts              = var.accounts
  exclude_resource_tags = var.exclude_resource_tags
  resource_tags         = var.resource_tags
  logging_bucket_arn    = var.logging_bucket_arn

  providers = {
    aws = aws.us-east-1
  }
}

# N. Virginia
module "policy_us-east-1" {
  source                = "./submodule"
  count                 = contains(var.regions, "us-east-1") ? 1 : 0
  policy_name           = var.policy_name
  scope                 = "REGIONAL"
  managed_rules         = var.managed_rules
  rule_groups           = lookup(var.rule_groups, "us-east-1", [])
  accounts              = var.accounts
  exclude_resource_tags = var.exclude_resource_tags
  resource_tags         = var.resource_tags
  logging_bucket_arn    = var.logging_bucket_arn

  providers = {
    aws = aws.us-east-1
  }
}

# Ohio
module "policy_us-east-2" {
  source                = "./submodule"
  count                 = contains(var.regions, "us-east-2") ? 1 : 0
  policy_name           = var.policy_name
  scope                 = "REGIONAL"
  managed_rules         = var.managed_rules
  rule_groups           = lookup(var.rule_groups, "us-east-2", [])
  accounts              = var.accounts
  exclude_resource_tags = var.exclude_resource_tags
  resource_tags         = var.resource_tags
  logging_bucket_arn    = var.logging_bucket_arn

  providers = {
    aws = aws.us-east-2
  }
}

# Sao Paulo
module "policy_sa-east-1" {
  source                = "./submodule"
  count                 = contains(var.regions, "sa-east-1") ? 1 : 0
  policy_name           = var.policy_name
  scope                 = "REGIONAL"
  managed_rules         = var.managed_rules
  rule_groups           = lookup(var.rule_groups, "sa-east-1", [])
  accounts              = var.accounts
  exclude_resource_tags = var.exclude_resource_tags
  resource_tags         = var.resource_tags
  logging_bucket_arn    = var.logging_bucket_arn

  providers = {
    aws = aws.sa-east-1
  }
}

# module "policy_af-south-1" {
#   source                = "./submodule"
#   count                 = contains(var.regions, "af-south-1") ? 1 : 0
#   policy_name           = var.policy_name
#   scope                 = "REGIONAL"
#   managed_rules         = var.managed_rules
#   rule_groups           = lookup(var.rule_groups, "af-south-1", [])
#   accounts              = var.accounts
#   exclude_resource_tags = var.exclude_resource_tags
#   resource_tags         = var.resource_tags
#   logging_bucket_arn    = var.logging_bucket_arn

#   providers = {
#     aws = aws.af-south-1
#   }
# }

# module "policy_ap-east-1" {
#   source                = "./submodule"
#   count                 = contains(var.regions, "ap-east-1") ? 1 : 0
#   policy_name           = var.policy_name
#   scope                 = "REGIONAL"
#   managed_rules         = var.managed_rules
#   rule_groups           = lookup(var.rule_groups, "ap-east-1", [])
#   accounts              = var.accounts
#   exclude_resource_tags = var.exclude_resource_tags
#   resource_tags         = var.resource_tags
#   logging_bucket_arn    = var.logging_bucket_arn

#   providers = {
#     aws = aws.ap-east-1
#   }
# }

module "policy_ap-south-1" {
  source                = "./submodule"
  count                 = contains(var.regions, "ap-south-1") ? 1 : 0
  policy_name           = var.policy_name
  scope                 = "REGIONAL"
  managed_rules         = var.managed_rules
  rule_groups           = lookup(var.rule_groups, "ap-south-1", [])
  accounts              = var.accounts
  exclude_resource_tags = var.exclude_resource_tags
  resource_tags         = var.resource_tags
  logging_bucket_arn    = var.logging_bucket_arn

  providers = {
    aws = aws.ap-south-1
  }
}

module "policy_ap-northeast-3" {
  source                = "./submodule"
  count                 = contains(var.regions, "ap-northeast-3") ? 1 : 0
  policy_name           = var.policy_name
  scope                 = "REGIONAL"
  managed_rules         = var.managed_rules
  rule_groups           = lookup(var.rule_groups, "ap-northeast-3", [])
  accounts              = var.accounts
  exclude_resource_tags = var.exclude_resource_tags
  resource_tags         = var.resource_tags
  logging_bucket_arn    = var.logging_bucket_arn

  providers = {
    aws = aws.ap-northeast-3
  }
}

module "policy_ap-northeast-2" {
  source                = "./submodule"
  count                 = contains(var.regions, "ap-northeast-2") ? 1 : 0
  policy_name           = var.policy_name
  scope                 = "REGIONAL"
  managed_rules         = var.managed_rules
  rule_groups           = lookup(var.rule_groups, "ap-northeast-2", [])
  accounts              = var.accounts
  exclude_resource_tags = var.exclude_resource_tags
  resource_tags         = var.resource_tags
  logging_bucket_arn    = var.logging_bucket_arn

  providers = {
    aws = aws.ap-northeast-2
  }
}

module "policy_ap-southeast-1" {
  source                = "./submodule"
  count                 = contains(var.regions, "ap-southeast-1") ? 1 : 0
  policy_name           = var.policy_name
  scope                 = "REGIONAL"
  managed_rules         = var.managed_rules
  rule_groups           = lookup(var.rule_groups, "ap-southeast-1", [])
  accounts              = var.accounts
  exclude_resource_tags = var.exclude_resource_tags
  resource_tags         = var.resource_tags
  logging_bucket_arn    = var.logging_bucket_arn

  providers = {
    aws = aws.ap-southeast-1
  }
}

module "policy_ap-southeast-2" {
  source                = "./submodule"
  count                 = contains(var.regions, "ap-southeast-2") ? 1 : 0
  policy_name           = var.policy_name
  scope                 = "REGIONAL"
  managed_rules         = var.managed_rules
  rule_groups           = lookup(var.rule_groups, "ap-southeast-2", [])
  accounts              = var.accounts
  exclude_resource_tags = var.exclude_resource_tags
  resource_tags         = var.resource_tags
  logging_bucket_arn    = var.logging_bucket_arn

  providers = {
    aws = aws.ap-southeast-2
  }
}

module "policy_ap-northeast-1" {
  source                = "./submodule"
  count                 = contains(var.regions, "ap-northeast-1") ? 1 : 0
  policy_name           = var.policy_name
  scope                 = "REGIONAL"
  managed_rules         = var.managed_rules
  rule_groups           = lookup(var.rule_groups, "ap-northeast-1", [])
  accounts              = var.accounts
  exclude_resource_tags = var.exclude_resource_tags
  resource_tags         = var.resource_tags
  logging_bucket_arn    = var.logging_bucket_arn

  providers = {
    aws = aws.ap-northeast-1
  }
}

module "policy_ca-central-1" {
  source                = "./submodule"
  count                 = contains(var.regions, "ca-central-1") ? 1 : 0
  policy_name           = var.policy_name
  scope                 = "REGIONAL"
  managed_rules         = var.managed_rules
  rule_groups           = lookup(var.rule_groups, "ca-central-1", [])
  accounts              = var.accounts
  exclude_resource_tags = var.exclude_resource_tags
  resource_tags         = var.resource_tags
  logging_bucket_arn    = var.logging_bucket_arn

  providers = {
    aws = aws.ca-central-1
  }
}

module "policy_eu-central-1" {
  source                = "./submodule"
  count                 = contains(var.regions, "eu-central-1") ? 1 : 0
  policy_name           = var.policy_name
  scope                 = "REGIONAL"
  managed_rules         = var.managed_rules
  rule_groups           = lookup(var.rule_groups, "eu-central-1", [])
  accounts              = var.accounts
  exclude_resource_tags = var.exclude_resource_tags
  resource_tags         = var.resource_tags
  logging_bucket_arn    = var.logging_bucket_arn

  providers = {
    aws = aws.eu-central-1
  }
}

module "policy_eu-west-1" {
  source                = "./submodule"
  count                 = contains(var.regions, "eu-west-1") ? 1 : 0
  policy_name           = var.policy_name
  scope                 = "REGIONAL"
  managed_rules         = var.managed_rules
  rule_groups           = lookup(var.rule_groups, "eu-west-1", [])
  accounts              = var.accounts
  exclude_resource_tags = var.exclude_resource_tags
  resource_tags         = var.resource_tags
  logging_bucket_arn    = var.logging_bucket_arn

  providers = {
    aws = aws.eu-west-1
  }
}

module "policy_eu-west-2" {
  source                = "./submodule"
  count                 = contains(var.regions, "eu-west-2") ? 1 : 0
  policy_name           = var.policy_name
  scope                 = "REGIONAL"
  managed_rules         = var.managed_rules
  rule_groups           = lookup(var.rule_groups, "eu-west-2", [])
  accounts              = var.accounts
  exclude_resource_tags = var.exclude_resource_tags
  resource_tags         = var.resource_tags
  logging_bucket_arn    = var.logging_bucket_arn

  providers = {
    aws = aws.eu-west-2
  }
}

# module "policy_eu-south-1" {
#   source                = "./submodule"
#   count                 = contains(var.regions, "eu-south-1") ? 1 : 0
#   policy_name           = var.policy_name
#   scope                 = "REGIONAL"
#   managed_rules         = var.managed_rules
#   rule_groups           = lookup(var.rule_groups, "eu-south-1", [])
#   accounts              = var.accounts
#   exclude_resource_tags = var.exclude_resource_tags
#   resource_tags         = var.resource_tags
#   logging_bucket_arn    = var.logging_bucket_arn

#   providers = {
#     aws = aws.eu-south-1
#   }
# }

module "policy_eu-west-3" {
  source                = "./submodule"
  count                 = contains(var.regions, "eu-west-3") ? 1 : 0
  policy_name           = var.policy_name
  scope                 = "REGIONAL"
  managed_rules         = var.managed_rules
  rule_groups           = lookup(var.rule_groups, "eu-west-3", [])
  accounts              = var.accounts
  exclude_resource_tags = var.exclude_resource_tags
  resource_tags         = var.resource_tags
  logging_bucket_arn    = var.logging_bucket_arn

  providers = {
    aws = aws.eu-west-3
  }
}

module "policy_eu-north-1" {
  source                = "./submodule"
  count                 = contains(var.regions, "eu-north-1") ? 1 : 0
  policy_name           = var.policy_name
  scope                 = "REGIONAL"
  managed_rules         = var.managed_rules
  rule_groups           = lookup(var.rule_groups, "eu-north-1", [])
  accounts              = var.accounts
  exclude_resource_tags = var.exclude_resource_tags
  resource_tags         = var.resource_tags
  logging_bucket_arn    = var.logging_bucket_arn

  providers = {
    aws = aws.eu-north-1
  }
}

# module "policy_me-south-1" {
#   source                = "./submodule"
#   count                 = contains(var.regions, "me-south-1") ? 1 : 0
#   policy_name           = var.policy_name
#   scope                 = "REGIONAL"
#   managed_rules         = var.managed_rules
#   rule_groups           = lookup(var.rule_groups, "me-south-1", [])
#   accounts              = var.accounts
#   exclude_resource_tags = var.exclude_resource_tags
#   resource_tags         = var.resource_tags
#   logging_bucket_arn    = var.logging_bucket_arn

#   providers = {
#     aws = aws.me-south-1
#   }
# }