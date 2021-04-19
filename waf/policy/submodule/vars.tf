variable "managed_rules" {
  default = [
    # {
    #   "vendorName": "AWS",
    #   "managedRuleGroupName": "AWSManagedRulesSQLiRuleSet",
    #   "version": null,
    #   "excludeRules": [
    #     "blabla..."
    #   ],
    #   "action": "COUNT"
    # },
    # {
    #   "vendorName": "AWS",
    #   "managedRuleGroupName": "AWSManagedRulesAmazonIpReputationList",
    #   "version": null,
    #   "excludeRules": [],
    #   "action": "BLOCK"
    # }
  ]
}

variable "rule_groups" {
  default = [
    # {
    #   arn = module.waf.default_rule_group_us-east-1_arn
    #   excludeRules = [],
    #   action = "BLOCK"
    # }
  ]
}

variable "policy_name" {
}

variable "scope" {
}

variable "logging_bucket_arn" {
}

variable "accounts" {
  type = list(any)
}

variable "exclude_resource_tags" {
  default = true
}

variable "resource_tags" {
  default = {}
}