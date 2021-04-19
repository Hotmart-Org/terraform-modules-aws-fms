## WAF Example

Exemplo simples de utilização do módulo waf/policy. Além da policy, também é criado uma rule customizada para bloqueio de países.

O state não está configurado para ser salvo em algum storage, será criado o .tfstate local, ao copiar o exemplo para seu projeto, ajuste para salvar em local seguro.

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accounts"></a> [accounts](#input\_accounts) | Accounts that the policy will be applied | `list(string)` | n/a | yes |
| <a name="input_logging_bucket_arn"></a> [logging\_bucket\_arn](#input\_logging\_bucket\_arn) | Bucket to store logs | `string` | n/a | yes |
| <a name="input_countries"></a> [countries](#input\_countries) | Countries to be blocked | `list(string)` | n/a | yes |

### Como rodar

```bash
terraform init
TF_VAR_accounts=["111111111111"] TF_VAR_logging_bucket_arn=arn:aws:s3:::SEU_BUCKET terraform apply -var="countries=[\"COUNTRY_CODE\"]"
```