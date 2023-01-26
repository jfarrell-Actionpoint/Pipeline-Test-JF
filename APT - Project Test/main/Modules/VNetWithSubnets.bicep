@description('Specifies parameters for resources.')
param vnetName string 
param vnetLocation string
param vnetRange string 
param vnetSub1Name string
param vnetSub1Range string 
param vnetSub2Name string 
param vnetSub2Range string



resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: vnetName
  location: vnetLocation
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetRange
      ]
    }
    subnets: [
      {
        name: vnetSub1Name
        properties: {
          addressPrefix: vnetSub1Range
        }
      }
      {
        name: vnetSub2Name
        properties: {
          addressPrefix: vnetSub2Range
        }
      }
    ]
  }
}

