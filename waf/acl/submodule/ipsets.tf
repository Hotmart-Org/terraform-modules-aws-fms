resource "aws_wafv2_ip_set" "whitelisted_ips" {
  name               = "whitelisted_ips"
  description        = "Partners, units and NAT Gateway ips"
  scope              = var.scope
  ip_address_version = "IPV4"
  addresses          = var.whitelisted_ips

  tags = {
    Kind      = "wafv2 ipset"
    Proposal  = "Partners, units and NAT Gateway ips"
    Region    = var.scope == "CLOUDFRONT" ? "global" : data.aws_region.current.name
    Terraform = "TRUE"
  }
}