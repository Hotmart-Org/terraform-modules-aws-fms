output "geo_rule_group" {
  value = {
    global    = [{ arn = module.geo-rule-group_global.rule_group_arn }]
    us-east-1 = [{ arn = module.geo-rule-group_us-east-1.rule_group_arn }]
  }
}