module "policy_acl" {
  source     = "github.com/Hotmart-Org/terraform-modules-aws-fms/waf/acl"
  name       = "policy_acl"

  rate_limit        = 100
  rate_limit_action = "block"

  regions = ["global", "us-east-1"]

  whitelisted_ips = ["1.1.1.1/32"]
}