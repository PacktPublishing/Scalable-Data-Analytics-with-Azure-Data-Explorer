$resource_group_name = 'adx-rg'
$location = 'westeurope'
$cluster_name = 'adxmyerscough'
$db_name = 'adxdb'
$hot_cache = 'P31D'
$retention_period = 'P365D'

# install the az kusto module
az extension add --name kusto

# Get a list of all Azure locations. You will need to specify a location when 
# creating your resources.
az account list-locations

# Create a new resource group
az group create --location $location --name $resource_group_name

# Get Cluster SKUs
az kusto cluster list-sku

# Create ADX Cluster
az kusto cluster create --cluster-name $cluster_name --sku name="Dev(No SLA)_Standard_D11_v2" tier="Basic" --resource-group $resource_group_name --location $location

# Create Database
az kusto database create --cluster-name $cluster_name --database-name $db_name --read-write-database soft-delete-period=$retention_period hot-cache-period=$hot_cache location=$location --resource-group $resource_group_name