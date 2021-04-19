variable "profile" {
  default = "default"
}

variable "rate_limit" {
  default = 0
}

variable "rate_limit_action" {
  default = "block"
}

variable "custom_rule_group_arn" {
  default = null
}

variable "managed_rules" {
  default = []
}

variable "name" {
}

variable "regions" {
  type = list
}

variable "whitelisted_ips" {
  type = list(string)
}