# Projeto utilizando TerraForm 

## Objetivo

### Definição de infraestrutura na AWS com:
- [x] Security group interno
- [x] Security group externo
- [x] EC2
- [x] TargetGroup
- [x] ALB
- [x] RDS (MySQL)
- [x] Bucket no S3 (arquivos estáticos)
- [x] Bucket no S3 (estado do terraform)

## Setup
- Clone este repo
- Crie na AWS um bucket no S3 chamado: ```running-state```
- Altere as variaveis de ambiente de acordo com a sua conta, e defina no main o caminho de onde encontra-se sua chave pública.
- ```terraform init```
- ```terraform apply -auto-approve```

Enjoy!

