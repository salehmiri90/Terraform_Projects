## Terraform ESXi Provider Configuration
This repository contains Terraform code to manage virtual machines on an ESXi host using the ESXi provider. The code allows you to define and provision virtual machines (VMs) with specific configurations, including network interfaces and disk storage.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Variables](#variables)
- [Resources](#resources)
- [License](#license)

## Prerequisites

Before using this Terraform configuration, ensure you have the following:

- **Terraform**: Make sure you have Terraform installed on your machine. You can download it from [terraform.io](https://www.terraform.io/downloads.html).
- **ESXi Host**: You need access to an ESXi host with valid credentials.
- **ESXi Provider**: Ensure the ESXi provider is available in your Terraform setup.

## Usage

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Configure Variables**:
Create a terraform.tfvars file or set environment variables for the following variables:
    ```bash
    esxi_hostname = "<your-esxi-hostname>"
    esxi_hostport = "<your-esxi-hostport>"  # Default is usually 443
    esxi_hostssl  = true                     # Set to false if not using SSL
    esxi_username = "<your-esxi-username>"
    esxi_password = "<your-esxi-password>"
    ```

