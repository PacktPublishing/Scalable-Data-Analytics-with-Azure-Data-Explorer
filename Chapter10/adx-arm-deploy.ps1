# If you want to deploy your ARM templates from your local machine rather than Cloud Shell, then
# you need to authenticate to Azure by using the following command.
# Connect-AzAccount

# Create a resource group. This is where we will deploy our ADX cluster to.
# You can use Get-AzLocation to get a list of available locations. West Europe
# is the closest AZ location to me.

$resourceGroupName = "adx-rg"
New-AzResourceGroup -Name $resourceGroupName -Location "westeurope" -Force

# Deploy our ARM templates to the resource group we just created.
New-AzResourceGroupDeployment -Name "AdxChapter10Deployment" -ResourceGroupName $resourceGroupName -TemplateFile ./templates/publicIp.json -TemplateParameterFile ./parameters/dmPublicIp.params.json
