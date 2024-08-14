Application original source code from https://github.com/pallets/flask/tree/master/examples/tutorial<br/>
<br/><br/>
VARIABLES:<br/>
ACR_PASSWORD = Container Registry password.<br/>
ACR_URL = Container Registry URL.<br/>
ACR_USERNAME = Container Registry Username.<br/>
APP_NAME = Application Name.<br/>
BLOB_NAME = Name of the blob that terraform will use. (This blob must be created beforehand, terraform will save the state in it).<br/>
CLIENT_ID = ID of Azure Service Principal.<br/>
CONTAINER_NAME: Name of the container within Azure Blob Storage that stores terarform state.<br/>
ENVIRONMENT: Indicates the deployment environment (e.g., production, development, testing).<br/>
IMAGE_NAME: Name of the container image that is being used or deployed.<br/>
LOCATION: Azure region where the resources are being deployed (e.g., "eastus").<br/>
RG_BACKEND: Name of the resource group in Azure that contains the backend resources (blob used by terraform).<br/>
SA_NAME: Name of the Azure storage account used to store blob used by terraform.<br/>
SKU_ASP: Specification of the SKU (Stock Keeping Unit) for the App Service Plan in Azure, which defines capacity and pricing.<br/>
SONAR_PROJECT_KEY: A unique key that identifies a project in SonarQube, used for performing code analysis.<br/>
SONAR_SERVICE_CONNECTION: A service connection configured for integration with SonarQube, used in CI/CD pipelines.<br/>
STO_ACCESS_KEY: Access key for the Azure storage account, which allows access to storage resources.<br/>
STO_CONNECTION_STRING: Connection string that contains all the information needed to connect to an Azure storage account.<br/>
STO_NAME: Name of the Azure storage account, specifying where the data is stored.<br/>
SUBSCRIPTION_ID: Unique identifier of the Azure subscription, associated with Azure resources and services.<br/>
