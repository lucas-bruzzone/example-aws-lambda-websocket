# example-aws-lambda-websocket

Repositório para função Lambda baseado em template Terraform

## Descrição

Este repositório contém a infraestrutura como código (Terraform) para uma função Lambda AWS com:
- Função Lambda Python 3.11
- Lambda Layer para dependências
- Role IAM com permissões básicas
- Security Group configurado
- Integração com VPC via remote state

## Pré-requisitos

1. Bucket S3: `example-aws-lambda-websocket-terraform-state`
2. Tabela DynamoDB: `example-aws-lambda-websocket-terraform-lock`
3. Repositório de network: `example-aws-lambda-websocket-network` com state em `example-aws-lambda-websocket-network-terraform-state`
4. Secret `AWS_ROLE_ARN` configurado no GitHub

## Estrutura

- `terraform/` - Arquivos Terraform
- `code/` - Código fonte da Lambda
- `lambda-layer/` - Dependências Python para layer
- `.github/workflows/` - GitHub Actions para deploy
- `tfvars/` - Arquivos de variáveis

## Deploy

### Automático
Deploy automático via GitHub Actions quando há push na branch main.

### Manual
```bash
cd terraform
terraform init
terraform plan -var-file="tfvars/devops.tfvars"
terraform apply -var-file="tfvars/devops.tfvars"
```

## Configuração

1. Ajuste as variáveis em `tfvars/devops.tfvars`
2. Modifique o código Lambda em `code/lambda_function.py`
3. Adicione dependências Python em `lambda-layer/requirements.txt`

## Outputs

- `lambda_function_name` - Nome da função Lambda
- `lambda_function_arn` - ARN da função Lambda
- `lambda_invoke_arn` - ARN de invocação
- `lambda_layer_arn` - ARN do Lambda Layer
