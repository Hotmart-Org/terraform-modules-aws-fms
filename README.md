## terraform-modules-aws-fms

Módulo para setup de policies Firewall Manager. As policies devem ser criadas na conta master do FMS, quando criada, elas replicam para as contas da organization de acordo com a configuração de "accounts" informadas na configuração da policy. Quando forem criados novos recursos nas contas alvo, como API Gateway, ALB, CloudFront ou Security Grouyp, eles serão associados automaticamente às policies definidas no FMS. É possível especificar qual recurso será ou não associado, conforme necessidade. Na documentação de cada módulo deste projeto é possível ver como.

O objetivo dos módulos é criar uma mesma policy em todas as regiões previamente definidas, informadar via varável do módulo. Ainda não é suportado um loop alterando-se o provider aws, de forma a se ter um módulo que loopa nas regiões definidas e crie os recursos, desta forma, foi feito uma abstração, utilizando-se módulo dentro de módulo para tornar a utilização final mais simples.

## Repositório consiste nos seguintes módulos:

- [WAF](https://github.com/Hotmart-Org/terraform-modules-aws-fms/blob/master/waf/)

- [Security Group](https://github.com/Hotmart-Org/terraform-modules-aws-fms/blob/master/sgr/)