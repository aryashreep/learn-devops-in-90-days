# ☁️ Terraform CLI Cheatsheet

## 🚀 Essential Commands

| Command | Description |
|---|---|
| `terraform init` | Initialize working directory, download providers & modules |
| `terraform plan` | Preview changes before applying |
| `terraform apply` | Provision/update infrastructure |
| `terraform destroy` | Tear down all managed resources |
| `terraform validate` | Check configuration syntax and internal consistency |
| `terraform fmt` | Format HCL files to canonical style |
| `terraform version` | Display Terraform version |

## 📦 State Management

| Command | Description |
|---|---|
| `terraform state list` | List resources tracked in state |
| `terraform state show <resource>` | Show details of a single resource |
| `terraform state mv <src> <dest>` | Move resource in state (refactor) |
| `terraform state rm <resource>` | Remove resource from state (not delete infrastructure) |
| `terraform state pull` | Download current state to stdout |
| `terraform state push` | Upload local state to remote backend |
| `terraform refresh` | Update state to match real-world infrastructure |

## 🏗️ Workspace Commands

| Command | Description |
|---|---|
| `terraform workspace new <name>` | Create a new workspace |
| `terraform workspace list` | List all workspaces (* = active) |
| `terraform workspace select <name>` | Switch to a workspace |
| `terraform workspace show` | Show current workspace name |
| `terraform workspace delete <name>` | Delete an empty workspace |

## 🔄 Plan & Apply Options

| Flag | Description |
|---|---|
| `-auto-approve` | Skip interactive approval for apply/destroy |
| `-var 'key=value'` | Set a variable from command line |
| `-var-file=<file>.tfvars` | Load variable values from file |
| `-target=<resource>` | Apply only to specific resource |
| `-destroy` | Create a destroy plan |
| `-out=<file>` | Save plan to a file |
| `-compact-warnings` | Show warnings in compact form |

## 📁 Common File Structure

```
project/
├── main.tf          # Main resource declarations
├── variables.tf     # Input variable definitions
├── outputs.tf       # Output value definitions
├── terraform.tfvars # Variable assignments (values)
├── provider.tf      # Provider configuration
├── modules/         # Local modules directory
│   └── webserver/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── backend.tf       # Remote backend config
```

## 🔐 Security Best Practices

- Never hardcode secrets in HCL files
- Use `sensitive = true` on outputs containing passwords/keys
- Store state remotely (S3 + DynamoDB locking) for team use
- Add `terraform.tfstate*` and `*.tfvars` to `.gitignore`
- Use OIDC or environment variables for cloud provider auth
- Run `tfsec` or `checkov` for security scanning in CI/CD

## 📝 HCL Syntax Quick Reference

```hcl
# Provider Configuration
provider "aws" {
  region = "us-east-1"
}

# Resource Block
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  
  tags = {
    Name = "WebServer-${var.env}"
  }
}

# Data Source
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
  }
}

# Variable Definition
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# Output Value
output "public_ip" {
  value       = aws_instance.web.public_ip
  description = "The public IP of the web server"
}

# Module Call
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"
  
  name = "my-vpc"
  cidr = "10.0.0.0/16"
}

# Remote Backend
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "env:/${terraform.workspace}/infra.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}

# Workspace-Aware Configuration
locals {
  instance_config = {
    dev  = { type = "t2.micro", count = 1 }
    prod = { type = "t2.large", count = 3 }
  }
  env_config = local.instance_config[terraform.workspace]
}
```

## 🔗 Related Modules

- [Terraform AWS Modules](https://github.com/terraform-aws-modules) — Official AWS community modules
- [Terraform Registry](https://registry.terraform.io/) — Public module registry
- [HashiCorp Learn](https://learn.hashicorp.com/terraform) — Official tutorials
