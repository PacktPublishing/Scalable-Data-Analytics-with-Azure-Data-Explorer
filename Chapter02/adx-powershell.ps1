# If you are following a long with the exercises, you can skip the first
# three commands. The first three commands are required if you are using your local
# PowerShell prompt and not the Cloud Shell to install the Az modules locally and
# to authenticate with Azure

# First check to see if the modules are installed
Get-InstalledModule Az

# If the Az Module is not installed, install it.
Install-Module -Name Az -AllowClobber -Force 

# Next connect to Azure
Connect-AzAccount

# S T A R T  H E R E  Y O U R E  U S I N G  C L O U D  S H E L L

# Get a list of all Azure locations. You will need to specify a location when 
# creating your resources.
Get-AzLocation | Select-Object Location

# Create a new resource group
New-AzResourceGroup -Name 'adx-rg' -Location westeurope

# Check cluster name availability
Test-AzKustoClusterNameAvailability -Location 'westeurope' -Name 'adxmyerscough' -Type 'Microsoft.Kusto/clusters'

# Get Cluster SKUs
Get-AzKustoClusterSku

# Create ADX Cluster
New-AzKustoCluster -ResourceGroupName 'adx-rg' -Name 'adxmyerscough' -Location 'westeurope' -SkuName 'Dev(No SLA)_Standard_D11_v2' -SkuTier 'Basic' -SkuCapacity 1

# Test Database name availability
Test-AzKustoDatabaseNameAvailability -ResourceGroupName 'adx-rg' -ClusterName 'adxmyerscough' -Name 'adxdb' -Type 'Microsoft.Kusto/Clusters/Databases'

# Create Database
New-AzKustoDatabase -ResourceGroupName 'adx-rg' -ClusterName 'adxmyerscough' -Name 'adxdb' -Kind ReadWrite -Location 'westeurope'