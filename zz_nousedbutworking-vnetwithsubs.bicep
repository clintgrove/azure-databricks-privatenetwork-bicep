@description('VNet name')
param vnetName string = 'VNet1'

@description('Address prefix')
param vnetAddressPrefix string = '10.29.0.0/23'

@description('Subnet 1 Prefix')
param subnet1Prefix string = '10.29.1.0/27'

@description('Subnet 1 Name')
param subnet1Name string = 'private-link-2'

@description('Subnet 2 Prefix')
param subnet2Prefix string = '10.29.0.128/25'

@description('Subnet 2 Name')
param subnet2Name string = 'private-subnet-2'

@description('Subnet 3 Prefix')
param subnet3Prefix string = '10.29.0.0/25'

@description('Subnet 3 Name')
param subnet3Name string = 'public-subnet-2'

@description('Location for all resources.')
param location string = resourceGroup().location

resource vnet 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: subnet1Name
        properties: {
          addressPrefix: subnet1Prefix
        }
      }
      {
        name: subnet2Name
        properties: {
          addressPrefix: subnet2Prefix
        }
      }
      {
        name: subnet3Name
        properties: {
          addressPrefix: subnet3Prefix
        }
      }
    ]
  }
  resource subnet1 'subnets' existing = {
    name: subnet1Name
  }
  resource subnet2 'subnets' existing = {
    name: subnet2Name
  }
  resource subnet3 'subnets' existing = {
    name: subnet3Name
  }
}

output subnet1ResourceId string = vnet::subnet1.id
output subnet2ResourceId string = vnet::subnet2.id
output subnet3ResourceId string = vnet::subnet3.id
