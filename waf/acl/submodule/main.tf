data "aws_region" "current" {}

data "external" "name" {
  program = ["${path.module}/get_name.sh", var.name, var.scope, data.aws_region.current.name]
}

resource "aws_wafv2_web_acl" "acl" {
  name  = data.external.name.result.name
  scope = var.scope

  default_action {
    allow {}
  }

  dynamic "rule" {

    for_each = var.custom_rule_group_arn != "" ? [""] : []

    content {
      name     = "custom-rule-group"
      priority = 0

      override_action {
        none {}
      }

      statement {
        rule_group_reference_statement {
          arn = var.custom_rule_group_arn
        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name                = "custom-rule-group"
        sampled_requests_enabled   = true
      }
    }
  }

  dynamic "rule" {

    for_each = var.managed_rules

    content {
      name     = lookup(rule.value, "name")
      priority = rule.key + 1

      override_action {
        dynamic "none" {
          for_each = lower(lookup(rule.value, "action", "none")) == "none" ? [""] : []
          content {}
        }
        dynamic "count" {
          for_each = lower(lookup(rule.value, "action", "none")) == "count" ? [""] : []
          content {}
        }
      }

      statement {
        managed_rule_group_statement {
          name        = lookup(rule.value, "name")
          vendor_name = lookup(rule.value, "vendor_name")

          dynamic "excluded_rule" {

            for_each = lookup(rule.value, "excluded_rule", [])

            content {
              name = excluded_rule.value
            }
          }
        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name                = lookup(rule.value, "name")
        sampled_requests_enabled   = true
      }
    }
  }

  dynamic "rule" {

    for_each = var.rate_limit > 0 ? [""] : []

    content {
      name     = "rate-limit-xff"
      priority = 1 + length(var.managed_rules)

      action {
        dynamic "block" {
          for_each = lower(lower(var.rate_limit_action)) == "block" ? [""] : []
          content {}
        }
        dynamic "allow" {
          for_each = lower(var.rate_limit_action) == "allow" ? [""] : []
          content {}
        }
        dynamic "count" {
          for_each = lower(var.rate_limit_action) == "count" ? [""] : []
          content {}
        }
      }

      statement {
        rate_based_statement {
          limit              = var.rate_limit
          aggregate_key_type = "FORWARDED_IP"

          forwarded_ip_config {
            fallback_behavior = "NO_MATCH"
            header_name       = "X-Forwarded-For"
          }

          scope_down_statement {
            not_statement {
              statement {
                ip_set_reference_statement {
                  arn = aws_wafv2_ip_set.whitelisted_ips.arn

                  ip_set_forwarded_ip_config {
                    fallback_behavior = "NO_MATCH"
                    header_name       = "X-Forwarded-For"
                    position          = "ANY"
                  }
                }
              }
            }
          }
        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name                = "rate-limit-xff"
        sampled_requests_enabled   = true
      }
    }
  }

  dynamic "rule" {

    for_each = var.rate_limit > 0 ? [""] : []

    content {
      name     = "rate-limit"
      priority = 2 + length(var.managed_rules)

      action {
        dynamic "block" {
          for_each = lower(lower(var.rate_limit_action)) == "block" ? [""] : []
          content {}
        }
        dynamic "allow" {
          for_each = lower(var.rate_limit_action) == "allow" ? [""] : []
          content {}
        }
        dynamic "count" {
          for_each = lower(var.rate_limit_action) == "count" ? [""] : []
          content {}
        }
      }

      statement {
        rate_based_statement {
          limit              = var.rate_limit
          aggregate_key_type = "IP"

          scope_down_statement {
            and_statement {
              statement {
                not_statement {
                  statement {
                    ip_set_reference_statement {
                      arn = aws_wafv2_ip_set.whitelisted_ips.arn
                    }
                  }
                }
              }
              statement {
                not_statement {
                  statement {
                    ip_set_reference_statement {
                      arn = aws_wafv2_ip_set.whitelisted_ips.arn

                      ip_set_forwarded_ip_config {
                        fallback_behavior = "NO_MATCH"
                        header_name       = "X-Forwarded-For"
                        position          = "ANY"
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name                = "rate-limit"
        sampled_requests_enabled   = true
      }
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = var.name
    sampled_requests_enabled   = true
  }
}