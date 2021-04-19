## WAF Example

Exemplo simples de utilização do módulo waf/acl.

O state não está configurado para ser salvo em algum storage, será criado o .tfstate local, ao copiar o exemplo para seu projeto, ajuste para salvar em local seguro.

Outro ponto importante, o acl em si é criado pelo FMS, a utilização deste módulo de acl será necessária apenas se quiser criar regras de rate limit, que, por enquanto, não é suportada no FMS. Desta forma, é necessário importar o state dos acls criados em cada região antes de rodar o apply.

### Como rodar

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