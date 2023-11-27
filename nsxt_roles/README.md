# Terraform-Jenkins-NSXT
Terraform NSX-T Configuration
This Terraform project provides infrastructure as code for configuring NSX-T using Jenkins & Terraform pipelines.

<h1>Prerequisites</h1>

Before you can use this project, you must have the following:
A Jenkins server with the following plugins installed:
Pipeline
Pipeline Utility Steps
Terraform
It's optional to use a Git repository containing your Terraform code and Jenkins pipeline scripts
An NSX-T environment with the necessary credentials and permissions to configure it using Terraform.

<h1>Usage</h1>

To use this project, follow these steps:
Clone the Git repository containing your Terraform code to your Jenkins server.
In Jenkins, create a new pipeline job and configure it to use the Terraform plugin.
In the Jenkins pipeline script, add the following steps to configure your NSX-T environment using Terraform:

```bash
stage('Terraform Init') {
  steps {
    script {
      sh 'terraform init'
    }
  }
}

stage('Terraform Plan') {
  steps {
    script {
      sh 'terraform plan -out=tfplan'
    }
  }
}

stage('Terraform Apply') {
  steps {
    script {
      sh 'terraform apply tfplan'
    }
  }
}
```

This script initializes Terraform, generates a plan for the infrastructure changes, and applies the changes to your NSX-T environment.
Customize the Terraform code to match your specific NSX-T configuration needs.
Run the Jenkins pipeline job to configure your NSX-T environment using Terraform.

<h1>That's it!</h1>

You now have a Terraform project that launches from Jenkins pipelines to configure NSX-T. Note that you can customize the pipeline script and Terraform code to suit your specific needs, such as adding additional stages for testing or linting your code.
