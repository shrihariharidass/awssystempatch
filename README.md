# AWS System Patch

This project automates patch management for AWS systems using Terraform.

## Overview

The main infrastructure is defined in `main.tf`, which provisions AWS resources to manage and automate patching across your environment. The solution leverages AWS Systems Manager (SSM) Patch Manager to ensure your instances are up-to-date and compliant.

## Features

- Automated patching of EC2 instances
- Customizable patch baselines
- Scheduling via SSM Maintenance Windows
- Infrastructure as Code with Terraform

## Getting Started

1. Clone this repository.
2. Review and customize `main.tf` as needed.
3. Initialize and apply the Terraform configuration:

    ```sh
    terraform init
    terraform apply
    ```

4. Monitor patch compliance in the AWS Console.

## Learn More

For a detailed walkthrough, follow this [Medium article](https://medium.com/](https://shrihariharidas73.medium.com/automating-patch-management-with-aws-systems-manager-and-terraform-0af579553b18).

## Author

**Shrihari Haridas**  
AWS Community Builder, Cloud and DevOps Engineer
