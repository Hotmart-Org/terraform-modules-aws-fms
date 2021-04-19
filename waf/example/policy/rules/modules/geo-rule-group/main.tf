data "aws_region" "current" {}

resource "aws_wafv2_rule_group" "geo-rule-group" {
  name     = "geo-rule-group"
  scope    = var.scope
  capacity = 34

  rule {
    name     = "restricted-countries"
    priority = 0

    action {
      block {}
    }

    statement {
      or_statement {
        # se for de algum dos países listados
        statement {
          geo_match_statement {
            country_codes = var.countries
          }
        }

        statement {
          geo_match_statement {
            country_codes = var.countries

            forwarded_ip_config {
              fallback_behavior = "NO_MATCH"
              header_name       = "X-Forwarded-For"
            }
          }
        }
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name                = "restricted-countries"
      sampled_requests_enabled   = false
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = false
    metric_name                = "geo-rule-group"
    sampled_requests_enabled   = false
  }

  tags = {
    Kind      = "wafv2 rule-group"
    Proposal  = "geo-rule-group"
    Region    = var.scope == "CLOUDFRONT" ? "global" : data.aws_region.current.name
    Terraform = "TRUE"
  }
}