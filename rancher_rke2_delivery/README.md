# Rancher RKE2 Delivery with GitLab & Nexus Integration

This Terraform project automates the project delivery to the clients.
It's preparing a Kubernetes project and namespaces using Rancher RKE2. It also manages the creation of GitLab groups and projects, sets up Nexus repositories, and configures Nginx as a reverse proxy. The project leverages dynamic port allocation to ensure efficient resource usage.

## Features

- **Rancher2 Integration**: Creates projects and namespaces with resource quotas.
- **GitLab Setup**: Automates the creation of GitLab groups and projects, and manages user memberships.
- **Nexus Docker Repositories**: Configures hosted Docker repositories with dynamic port allocation.
- **Nginx Proxy**: Configures Nginx to proxy Nexus repositories with custom ports.

## Prerequisites

Ensure you have the following prerequisites before running the project:

- [Terraform](https://www.terraform.io/downloads.html) `v1.0+`
- Rancher2 API URL and Token
- GitLab API token and credentials
- Nexus credentials (username and password)
- SSH access to the target server for remote configurations

## Technologies and Tools
I employed various technologies, primarily utilizing Terraform, GitLab, Nexus, and Bash for the automation process.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/salehmiri90/Terraform_Projects.git
   cd rancher_rke2_delivery
   ```

2. Create a .tfvars file with the required variables:

    ```bash
    rancher_api_url   = "https://your-rancher-url"
    rancher_token_key = "your-rancher-api-token"
    project_name      = "Your Project Name"
    namespace_names   = ["namespace1", "namespace2"]
    gitlab_token      = "your-gitlab-token"
    nexus_user        = "nexus-username"
    nexus_pass        = "nexus-password"
    ssh_host          = "server-ip"
    start_port        = 3000
    end_port          = 4000
    ```

3. Run the following commands:

    ```bash
    terraform init
    terraform apply
    ```

# Configuration

## Rancher2 Project and Namespace

- **Creates a Rancher project with resource quotas (CPU and memory).**

- **Adds namespaces to the project, with default limits for each namespace.**

## GitLab Group, Project, and User

- **Creates a GitLab group and project with a specified user and permission levels.**

- **Example GitLab resources:**
        Group: `test_saleh`
        Project: `test_saleh_project`

## Free Port Finder

- **A module that checks and allocates available ports on the specified host.**

## Nexus Repository

- **Sets up a Nexus Docker repository with a dynamically assigned HTTP port.**

## Nginx Configuration

- **Configures an Nginx proxy to forward traffic to Nexus using the available port.**

- **The Nginx configuration is uploaded to the target host and reloaded.**

## Outputs

- **GitLab Group ID: Outputs the ID of the created GitLab group.**

- **Available Port: The dynamically selected port for Nexus.**

- **Nginx Configuration: Nginx proxy setup for the Nexus repository.**

## Modules

## Nexus Repository Module

- **Sets up a Nexus Docker repository using the provided project name and dynamic port.**

    ```bash
    resource "nexus_repository_docker_hosted" "docker_repo" {
    name = var.projectname
    http_port = var.http_port
    # Additional configuration...
    }
    ```

## Nginx Proxy Module

- **Generates an Nginx configuration file and uploads it to the target host.**

    ```bash
    resource "local_file" "nginx_config" {
    content  = data.template_file.nginx_config.rendered
    filename = "/tmp/${var.projectname}.conf"
    }
    ```

## Port Checker Module

- **Scans for free ports within a given range on the target host.**

    ```bash
    bash check_available_ports.sh ${var.start_port} ${var.end_port} ${var.ssh_host}
    ```

## Usage
After applying Terraform:

1. Access the Rancher UI to manage the created project and namespaces.

2. Use GitLab for version control and CI/CD pipelines.

3. Access Nexus via the configured Nginx proxy for Docker repositories.

## License
This project is licensed under the MIT License.

## ✍ Contribution
I am confident that working together with skilled individuals like yourself can improve the functionality, efficiency, and overall quality of our projects. Therefore, I would be delighted to see any forks from this project. Please feel free to use this code and share any innovative ideas to enhance it further.

## ☎ Contact information
#### 📧 salehmiri90@gmail.com
#### [Linkedin.com/in/salehmiri](https://www.linkedin.com/in/salehmiri)




