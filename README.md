
# Automated Azure Infrastructure Deployment

A modular Infrastructure as Code (IaC) project using Terraform and GitHub Actions to define and validate Azure infrastructure.

## Project Overview

This project demonstrates how to organize reusable Terraform modules and automate infrastructure validation and security scanning through GitHub Actions.

The configuration defines Azure infrastructure components in a development environment.

## Architecture

The project defines:

- Azure Resource Group
- Azure Virtual Network
- Web and Application Subnets
- Azure Storage Account

## Technology Stack

- Microsoft Azure
- Terraform
- GitHub Actions
- Trivy
- Git

## Project Structure

```text
.
├── .github/
│   └── workflows/
│       └── terraform.yml
├── environments/
│   └── dev/
│       └── terraform.tfvars.example
├── modules/
│   ├── resource-group/
│   ├── storage-account/
│   └── virtual-network/
├── main.tf
├── outputs.tf
├── providers.tf
├── variables.tf
└── README.md
```

## Terraform Modules

### Resource Group
Creates an Azure Resource Group with configurable name, region, and tags.

### Virtual Network
Creates an Azure Virtual Network and multiple subnets using reusable module inputs.

### Storage Account
Creates an Azure Storage Account with:
- Standard performance tier
- Locally redundant storage (LRS)
- TLS 1.2 minimum
- Public nested-item access disabled

## CI/CD Pipeline

GitHub Actions automatically runs on pushes and pull requests targeting the `main` branch.

Pipeline stages:

1. Checkout repository
2. Set up Terraform
3. Check Terraform formatting
4. Initialize Terraform without a remote backend
5. Validate Terraform configuration
6. Scan infrastructure configuration using Trivy

The pipeline performs validation and security scanning only. It does not deploy infrastructure.

## Local Setup

Install Terraform and Git.

Clone the repository:

```bash
git clone https://github.com/Thulasiraman-del/automated-azure-infrastructure-terraform-ci.git
cd automated-azure-infrastructure-terraform-ci
```

Create your development variables file:

```bash
cp environments/dev/terraform.tfvars.example environments/dev/terraform.tfvars
```

Edit the file with your own globally unique Storage Account name.

Initialize Terraform:

```bash
terraform init -backend=false
```

Format and validate:

```bash
terraform fmt -check -recursive
terraform validate
```

## Security and Configuration

- Environment-specific `.tfvars` files are excluded from Git.
- Terraform state files are excluded from Git.
- The Terraform dependency lock file is committed.
- Storage Account public nested-item access is disabled.
- Trivy scans Terraform configuration for security misconfigurations.

## Deployment Status

This repository contains Azure infrastructure definitions and an automated validation pipeline.

Live Azure deployment has not been performed because an Azure subscription is not currently available.

## Learning Outcomes

- Building reusable Terraform modules
- Defining Azure infrastructure as code
- Managing variables, outputs, and module dependencies
- Automating Terraform validation with GitHub Actions
- Scanning infrastructure configuration for security issues
- Organizing environment-specific configuration safely
