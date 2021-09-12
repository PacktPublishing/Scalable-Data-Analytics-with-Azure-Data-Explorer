# If you want to deploy your ARM templates from your local machine rather than Cloud Shell, then
# you need to authenticate to Azure by using the following command.
# Connect-AzAccount

# Create a resource group. This is where we will deploy our ADX cluster to.
# You can use Get-AzLocation to get a list of available locations. West Europe
# is the closest AZ location to me.

$resourceGroupName = "adx-subnet-delegation-rg"
$location = "westeurope"
New-AzResourceGroup -Name $resourceGroupName -Location $location -Force

Write-Information "Starting resource deployment..."

# Deploy the NSG and route table
New-AzResourceGroupDeployment -Name "AdxChapter10NSGDeployment" -ResourceGroupName $resourceGroupName -TemplateFile ./templates/nsg.json -TemplateParameterFile ./parameters/nsg.params.json
New-AzResourceGroupDeployment -Name "AdxChapter10RouteTableDeployment" -ResourceGroupName $resourceGroupName -TemplateFile ./templates/routeTable.json -TemplateParameterFile ./parameters/routeTable.params.json

#Deploy the virtual Network
New-AzResourceGroupDeployment -Name "AdxChapter10VNETDeployment" -ResourceGroupName $resourceGroupName -TemplateFile ./templates/vnet.json -TemplateParameterFile ./parameters/vnet.params.json

# Deploy our public IP resources.
New-AzResourceGroupDeployment -Name "AdxChapter10EngineIpDeployment" -ResourceGroupName $resourceGroupName -TemplateFile ./templates/publicIp.json -TemplateParameterFile ./parameters/enginePublicIp.params.json
New-AzResourceGroupDeployment -Name "AdxChapter10IngestionIpDeployment" -ResourceGroupName $resourceGroupName -TemplateFile ./templates/publicIp.json -TemplateParameterFile ./parameters/dmPublicIp.params.json

# Deploy the ADX cluster
New-AzResourceGroupDeployment -Name "AdxChapter10ClusterDeployment" -ResourceGroupName $resourceGroupName -TemplateFile ./templates/adxCluster.json -TemplateParameterFile ./parameters/adxCluster.params.json

Write-Information "Resource Deployment complete..."
