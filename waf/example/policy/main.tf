module "rules" {
  source = "./rules"
  countries = var.countries

  regions = ["global", "us-east-1"]
}

module "policy_acl" {
  source = "github.com/Hotmart-Org/terraform-modules-aws-fms/waf/policy"

  policy_name = "policy_acl"
  accounts    = var.accounts
  regions     = ["global", "us-east-1"]

  logging_bucket_arn  = var.logging_bucket_arn

  rule_groups = module.rules.geo_rule_group

  managed_rules = [
    {
      vendorName           = "AWS",
      managedRuleGroupName = "AWSManagedRulesAmazonIpReputationList",
    },
    {
      vendorName           = "AWS",
      managedRuleGroupName = "AWSManagedRulesCommonRuleSet",
      excludeRules = [
        "SizeRestrictions_BODY",
        "SizeRestrictions_QUERYSTRING"
      ],
      action = "BLOCK"
    },
    {
      vendorName           = "AWS",
      managedRuleGroupName = "AWSManagedRulesKnownBadInputsRuleSet",
      action               = "BLOCK"
    },
    {
      vendorName           = "AWS",
      managedRuleGroupName = "AWSManagedRulesSQLiRuleSet",
      action               = "BLOCK"
    },
    {
      vendorName           = "AWS",
      managedRuleGroupName = "AWSManagedRulesLinuxRuleSet",
      action               = "BLOCK"
    }
  ]
}