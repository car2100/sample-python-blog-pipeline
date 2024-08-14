Application original source code from https://github.com/pallets/flask/tree/master/examples/tutorial

Variables:
ACR_PASSWORD = Container Registry password.
ACR_URL = Container Registry URL.
ACR_USERNAME = Container Registry Username.
APP_NAME = Application Name.
BLOB_NAME = Name of the blob that terraform will use. (This blob must be created beforehand, terraform will save the state in it).
CLIENT_ID = ID of Azure Service Principal.
CONTAINER_NAME: Name of the container within Azure Blob Storage that stores terarform state.
ENVIRONMENT: Indicates the deployment environment (e.g., production, development, testing).
IMAGE_NAME: Name of the container image that is being used or deployed.
LOCATION: Azure region where the resources are being deployed (e.g., "eastus").
RG_BACKEND: Name of the resource group in Azure that contains the backend resources (blob used by terraform).
SA_NAME: Name of the Azure storage account used to store blob used by terraform.
SKU_ASP: Specification of the SKU (Stock Keeping Unit) for the App Service Plan in Azure, which defines capacity and pricing.
SONAR_PROJECT_KEY: A unique key that identifies a project in SonarQube, used for performing code analysis.
SONAR_SERVICE_CONNECTION: A service connection configured for integration with SonarQube, used in CI/CD pipelines.
STO_ACCESS_KEY: Access key for the Azure storage account, which allows access to storage resources.
STO_CONNECTION_STRING: Connection string that contains all the information needed to connect to an Azure storage account.
STO_NAME: Name of the Azure storage account, specifying where the data is stored.
SUBSCRIPTION_ID: Unique identifier of the Azure subscription, associated with Azure resources and services.
