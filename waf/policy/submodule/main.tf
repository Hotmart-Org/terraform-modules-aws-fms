data "external" "rules" {
  program = ["python", "${path.module}/rules.py", jsonencode(var.managed_rules), jsonencode(var.rule_groups), aws_kinesis_firehose_delivery_stream.firehose.arn]
}

locals {
  type      = var.scope == "REGIONAL" ? null : "AWS::CloudFront::Distribution"
  type_list = var.scope == "REGIONAL" ? ["AWS::ElasticLoadBalancingV2::LoadBalancer", "AWS::ApiGateway::Stage"] : null
  tags      = var.exclude_resource_tags ? "{\"fms_waf_acl_exclude_${var.policy_name}\": \"true\"}" : "{\"fms_waf_acl_include_${var.policy_name}\": \"true\"}"
}

resource "aws_fms_policy" "policy" {
  name                  = var.policy_name
  exclude_resource_tags = var.exclude_resource_tags
  remediation_enabled   = true
  resource_type         = local.type
  resource_type_list    = local.type_list

  resource_tags = jsondecode(local.tags)

  include_map {
    account = var.accounts
  }

  security_service_policy_data {
    type                 = "WAFV2"
    managed_service_data = data.external.rules.result.data
  }
}