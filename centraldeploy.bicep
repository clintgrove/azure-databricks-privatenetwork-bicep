
@description('Location for all resources.')
param location string = resourceGroup().location

@description('DATABRICKS - Specifies whether to deploy Azure Databricks workspace with Secure Cluster Connectivity (No Public IP) enabled or not')
param disablePublicIp bool = true
@description('DATABRICKS - The name of the Azure Databricks workspace to create.')
param workspaceName string = 'clintdbr99'
@description('DATABRICKS - The pricing tier of workspace.')
@allowed([
  'standard'
  'premium'
])
param pricingTier string = 'premium'
module databricksworkspace './databricksvnetinjection.bicep' = { 
  name: workspaceName
  params: { 
    location: location
    workspaceName: workspaceName
    disablePublicIp: disablePublicIp
    pricingTier: pricingTier

  }

}
