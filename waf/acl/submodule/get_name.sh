#!/usr/bin/env sh
result=$(aws wafv2 list-web-acls --scope $2 --region $3 --query "WebACLs[?contains(Name, 'WebACLV2$1')]" | jq -r '.[].Name')
echo {\"name\":\"$result\"}