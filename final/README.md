├── azure-pipelines.yml
├── terraform
│   ├── main.tf
│   ├── variables.tf
│   ├── backend.tf
│   ├── outputs.tf
│   └── website
│       └── index.html


Placeholders to Update:
<RESOURCE_GROUP_NAME_PLACEHOLDER>: Name of the Azure resource group.
<LOCATION_PLACEHOLDER>: Azure region for deployment (e.g., eastus).
<STORAGE_ACCOUNT_NAME_PLACEHOLDER>: Name of the Azure storage account for the static website.
<STORAGE_ACCOUNT_NAME_PLACEHOLDER_FOR_TERRAFORM_STATE>: Name of the Azure storage account for the Terraform backend.
<CONTAINER_NAME_PLACEHOLDER_FOR_TERRAFORM_STATE>: Name of the container inside the storage account for the Terraform backend.
Deployment Steps:
Update the placeholders in the files.
Push all files to a Git repository.
Create a new pipeline in Azure DevOps and select the repository.
Set up the Service Principal in Azure and provide its AZURE_CLIENT_ID, AZURE_CLIENT_SECRET, and AZURE_TENANT_ID as environment variables or pipeline variables in Azure DevOps.
Run the pipeline.
This pipeline will set up a static website hosted in an Azure Blob Storage and will print the website URL as an output.

yml config:
trigger:
- master

pool:
  vmImage: 'ubuntu-latest'

stages:
- stage: Deploy
  jobs:
  - job: Deploy
    steps:
    - task: AzureCLI@2
      inputs:
        azureSubscription: 'Your-Azure-Service-Connection-Name'
        scriptType: 'bash'
        scriptLocation: 'inlineScript'
        inlineScript: |
          cd terraform
          terraform init
          terraform apply -auto-approve
      displayName: 'Deploy to Azure with Terraform'

    - script: |
        curl -s -o /dev/null -w "%{http_code}" $(websiteUrl) | grep 200
        curl -s $(websiteUrl) | grep "Hello, World!"
      env:
        websiteUrl: $(terraform output website_url)
      displayName: 'Test Website'
