# EC2 Deployment with Terraform

This project uses [Terraform](https://www.terraform.io/) to deploy an EC2 instance on AWS.

---

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed
- AWS account and credentials set up (via `~/.aws/credentials` or environment variables)
- A valid EC2 key pair created in your AWS region
- A `.pem` file associated with the key pair for SSH access

---

## Project Structure
```bash
├── dev/ # Development environment configurations
│ ├── docker-compose.yml
│ ├── nginx.conf
│ ├── .env (self-created)
│ └── pull_images.sh
├── infra/ # Infrastructure modules
│ ├── bootstrap/
│ │    ├── main.tf
│ ├── dev/
│      ├── env/ # tfvars
│      ├── vpc/ # VPC module
│      │    ├── main.tf 
│      │    ├── outputs.tf 
│      │    ├── variables.tf 
│      ├── main.tf
│      ├── outputs.tf
│      └── variables.tfvars
│ 
└── README.md # You're here
```
##  Bootstrap Infrastructure Deployment

```bash
cd infra/bootstrap
terraform init
terraform plan 
terraform apply
```

## To destroy bootstrap resouces
```bash
terraform destroy
```

## Infra deployment

```bash
cd infra/dev
terraform init
terraform plan
terraform apply -var-file="env/dev.tfvars"
```
Please put the dev.tfvars file in the env directory.
To destroy the resources, run:
```bash
terraform destroy
```

