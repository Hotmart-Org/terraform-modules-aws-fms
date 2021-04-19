## WAF

Neste módulo são criados os aws_fms_policy e configuração do firehose para logs em cada região previamente definida.

Por padrão, as policies criarão uma instãncia de WebAcl, que serão associadas a todos os recursos web das contas. Caso haja algum recurso que precise excluir esta associação automática, basta cria-lo com suas devidas tags de exclusão: "fms_waf_acl_exclude_*NOME_POLICY* = true". Também é possível fazer com que a regra só associe o recurso caso ele tenha a tag "fms_waf_acl_include_*NOME_POLICY* = true", este comportamento é controlado pelo input exclude_resource_tags.

### Módulo policy

Responsável por criar um FMS Policy do tipo WAFV2, onde podemos definir quais [managed rules](https://docs.aws.amazon.com/waf/latest/developerguide/aws-managed-rule-groups-list.html) e custom rules serão aplicadas em quais contas AWS da organização.

#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.36.0 |

#### Submodules

| Name | Source |
|------|--------|
| policy\_af-south-1 | ./submodule |
| policy\_ap-east-1 | ./submodule |
| policy\_ap-northeast-1 | ./submodule |
| policy\_ap-northeast-2 | ./submodule |
| policy\_ap-northeast-3 | ./submodule |
| policy\_ap-south-1 | ./submodule |
| policy\_ap-southeast-1 | ./submodule |
| policy\_ap-southeast-2 | ./submodule |
| policy\_ca-central-1 | ./submodule |
| policy\_eu-central-1 | ./submodule |
| policy\_eu-north-1 | ./submodule |
| policy\_eu-south-1 | ./submodule |
| policy\_eu-west-1 | ./submodule |
| policy\_eu-west-2 | ./submodule |
| policy\_eu-west-3 | ./submodule |
| policy\_global | ./submodule |
| policy\_me-south-1 | ./submodule |
| policy\_us-east-1 | ./submodule |
| policy\_us-east-2 | ./submodule |

#### Submodule Resources

| Name | Type |
|------|------|
| [aws_fms_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/fms_policy) | resource |
| [aws_iam_policy.firehose-role-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.firehose-role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.firehose_role_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kinesis_firehose_delivery_stream.firehose](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [external_external.rules](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

#### Submodule Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_scope"></a> [scope](#input\_scope) | CLOUDFRONT or REGIONAL | `string` | n/a | yes |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accounts"></a> [accounts](#input\_accounts) | Accounts that the policy will be applied | `list(string)` | n/a | yes |
| <a name="input_regions"></a> [regions](#input\_regions) | Regions to apply this policy | `list(string)` | n/a | yes |
| <a name="input_exclude_resource_tags"></a> [exclude\_resource\_tags](#input\_exclude\_resource\_tags) | The strategy about tags, if it's true, the defined tags on var resource\_tags will be used to exclude resources. | `bool` | `true` | no |
| <a name="input_logging_bucket_arn"></a> [logging\_bucket\_arn](#input\_logging\_bucket\_arn) | Bucket to store logs | `string` | n/a | yes |
| <a name="input_managed_rules"></a> [managed\_rules](#input\_managed\_rules) | List of managed rules | `list` | `[]` | no |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | The policy name | `string` | n/a | yes |
| <a name="input_profile"></a> [profile](#input\_profile) | AWS profile | `string` | `"default"` | no |
| <a name="input_resource_tags"></a> [resource\_tags](#input\_resource\_tags) | The tags that will be used to exclude ou include resources. | `list` | `[]` | no |
| <a name="input_rule_groups"></a> [rule\_groups](#input\_rule\_groups) | Map of custom rules by region | `map` | `{}` | no |

#### Usage

```terraform
module "policy" {
  source = "github.com/Hotmart-Org/terraform-modules-aws-fms/waf/policy"

  policy_name = "NOME_POLICY"
  accounts    = [
    "ID_DA_CONTA_ONDE_ESSA_POLICY_SERÁ_ATIVADA"
  ]

  firehose_logging_arn = module.waf.firehose_logging_arn

  managed_rules = [
    {
      vendorName           = "AWS",
      managedRuleGroupName = "AWSManagedRulesAmazonIpReputationList",
    },
    {
      vendorName           = "AWS",
      managedRuleGroupName = "AWSManagedRulesCommonRuleSet",
      action               = "COUNT"
    }
    ...
  ]
}
```

#### [Example](https://github.com/Hotmart-Org/terraform-modules-aws-fms/blob/master/waf/example/policy/)



### Módulo acl

Responsável por customizar um waf web acl (v2) em cada conta, para, por exemplo, inclusão de regra de rate-limit (atualmente só funciona individualmente, por conta, na policy não tem como definir).

#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 3.36.0 |

#### Submodule

| Name | Source |
|------|--------|
| acl\_af-south-1 | ./submodule |
| acl\_ap-east-1 | ./submodule |
| acl\_ap-northeast-1 | ./submodule |
| acl\_ap-northeast-2 | ./submodule |
| acl\_ap-northeast-3 | ./submodule |
| acl\_ap-south-1 | ./submodule |
| acl\_ap-southeast-1 | ./submodule |
| acl\_ap-southeast-2 | ./submodule |
| acl\_ca-central-1 | ./submodule |
| acl\_eu-central-1 | ./submodule |
| acl\_eu-north-1 | ./submodule |
| acl\_eu-south-1 | ./submodule |
| acl\_eu-west-1 | ./submodule |
| acl\_eu-west-2 | ./submodule |
| acl\_eu-west-3 | ./submodule |
| acl\_global | ./submodule |
| acl\_me-south-1 | ./submodule |
| acl\_sa-east-1 | ./submodule |
| acl\_us-east-1 | ./submodule |
| acl\_us-east-2 | ./submodule |

#### Submodule Resources

| Name | Type |
|------|------|
| [aws_wafv2_web_acl.acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [external_external.name](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

#### Submodule Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_scope"></a> [scope](#input\_scope) | CLOUDFRONT or REGIONAL | `any` | n/a | yes |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_rule_group_arn"></a> [custom\_rule\_group\_arn](#input\_custom\_rule\_group\_arn) | n/a | `map` | `null` | no |
| <a name="input_managed_rules"></a> [managed\_rules](#input\_managed\_rules) | n/a | `list` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_profile"></a> [profile](#input\_profile) | n/a | `string` | `"default"` | no |
| <a name="input_rate_limit"></a> [rate\_limit](#input\_rate\_limit) | n/a | `number` | `0` | no |
| <a name="input_rate_limit_action"></a> [rate\_limit\_action](#input\_rate\_limit\_action) | n/a | `string` | `"block"` | no |
| <a name="input_regions"></a> [regions](#input\_regions) | Regions to apply this policy | `list` | n/a | yes |

#### Usage

```terraform
module "acl" {
  source = "github.com/Hotmart-Org/terraform-modules-aws-fms/waf/acl"
  name   = "NOME_POLICY"

  rate_limit        = 2000
  rate_limit_action = "count | block" # default is block

  custom_rule_group_arn = {
    global = "ARN RULE GROUP SCOPE CLOUDFRONT"
    us-east-1 = "ARN RULE GROUP SCOPE REGIONAL us-east-1"
  }

  managed_rules = [
    {
      vendorName           = "AWS",
      managedRuleGroupName = "AWSManagedRulesAmazonIpReputationList",
    },
    {
      vendorName           = "AWS",
      managedRuleGroupName = "AWSManagedRulesCommonRuleSet",
      action               = "COUNT"
    }
    ...
  ]
}
```

Obs.: este módulo, antes de aplicado em produção, precisa ser importado, pois o Web ACL é criado pelo FMS e a ideia é customizar o que foi criado, então precisa importar o state para depois aplicar, se isso não for feito o pipeline vai quebrar. Para isso, seguir os seguintes passos:

1. Ativar a policy na conta desejada

2. Preparar código para aplicar na conta alvo, utilizando o módulo descrito acima

3. Recuperar o id e name do Web ACL criado pelo FMS lá na conta alvo e imporar para o state, utilizando estes comandos:
```bash
terraform init

acl_name=NOME_POLICY

# escopo CLOUDFRONT
acl=$(aws wafv2 list-web-acls --scope CLOUDFRONT --region us-east-1 --query "WebACLs[?contains(Name, '$acl_name')]" | jq -r '.[]')
terraform import module.waf.module.acl_global.aws_wafv2_web_acl.acl $(echo $acl | jq -r '.Id')/$(echo $acl | jq -r '.Name')/CLOUDFRONT

# escopo REGIONAL, região de virginia
region=us-east-1
acl=$(aws wafv2 list-web-acls --scope REGIONAL --region $region --query "WebACLs[?contains(Name, '$acl_name')]" | jq -r '.[]')
terraform import module.waf.module.acl_$region.aws_wafv2_web_acl.acl $(echo $acl | jq -r '.Id')/$(echo $acl | jq -r '.Name')/REGIONAL

terraform apply
```

4. Aplicar sua alteração.

#### [Example](https://github.com/Hotmart-Org/terraform-modules-aws-fms/blob/master/waf/example/acl/)