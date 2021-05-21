

$resource_group_name = 'adx-rg'
$location = 'westeurope'
$cluster_name = 'adxmyerscough'
$db_name = 'adxdb'
$hot_cache = 31
$retention_period = 365


# Get a list of all Azure locations. You will need to specify a location when 
# creating your resources.
Get-AzLocation | Select-Object Location

# Create a new resource group
New-AzResourceGroup -Name $resource_group_name -Location $location

# Check cluster name availability
Test-AzKustoClusterNameAvailability -Location $location -Name $cluster_name -Type 'Microsoft.Kusto/clusters'

# Get Cluster SKUs
Get-AzKustoClusterSku

# Create ADX Cluster
New-AzKustoCluster -ResourceGroupName $resource_group_name -Name $cluster_name -Location $location -SkuName 'Dev(No SLA)_Standard_D11_v2' -SkuTier 'Basic' -SkuCapacity 1

# Test Database name availability
Test-AzKustoDatabaseNameAvailability -ResourceGroupName $resource_group_name -ClusterName $cluster_name -Name $db_name -Type 'Microsoft.Kusto/Clusters/Databases'

# Create Database
New-AzKustoDatabase -ResourceGroupName $resource_group_name -ClusterName $cluster_name -Name $db_name -Kind ReadWrite -Location $location -HotCachePeriod $hot_cache -SoftDeletePeriod $retention_period
