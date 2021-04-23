variable "managed_rules" {
  description = "List of managed rules"
  default = []
}

variable "rule_groups" {
  description = "Map of custom rules by region"
  default = {}
}

variable "policy_name" {
  description = "The policy name"
}

variable "accounts" {
  description = "Accounts that the policy will be applied"
  type = list(string)
}

variable "exclude_resource_tags" {
  description = "The strategy about tags, if it's true, the defined tags on var resource_tags will be used to exclude resources."
  default = true
}

variable "resource_tags" {
  description = "The tags that will be used to exclude ou include resources."
  default = []
}

variable "logging_bucket_arn" {
  description = "Bucket to store logs"
}

variable "regions" {
  type = list(string)
  description = "Regions to apply this policy"
}