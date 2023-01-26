@description('Specifies parameters for resources.')
param rgName string = 'Bicep-Test-RG'
param rgLocation string = 'North Europe'

// Setting target scope
targetScope = 'subscription'

@description('Creating resource group')
resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: rgName
  location: rgLocation
}

// Deploying 2 vnets with 2 subnets each using module

module virtualNetwork1 './Modules/VNetWithSubnets.bicep' = {
  name: 'newVnet'
  scope:rg
  params: {
   vnetName: 'Bicep-test-Vnet-1'
   vnetLocation: 'North Europe'
   vnetRange: '10.29.0.0/16'
   vnetSub1Name: 'defaultSubnet'
   vnetSub1Range: '10.29.1.0/24'
   vnetSub2Name: 'secondarySubnet'
   vnetSub2Range: '10.29.2.0/24'
  }
}

module virtualNetwork2 './Modules/VNetWithSubnets.bicep' = {
  name: 'newVnet2'
  scope:rg
  params: {
   vnetName: 'Bicep-test-Vnet-2'
   vnetLocation: 'North Europe'
   vnetRange: '10.30.0.0/16'
   vnetSub1Name: 'defaultSubnet'
   vnetSub1Range: '10.30.1.0/24'
   vnetSub2Name: 'secondarySubnet'
   vnetSub2Range: '10.30.2.0/24'
  }
}

// Deploying storage account using module


module storageAccount1 './Modules/StorageAccount.bicep' = {
  name: 'storageAccountDeployment'
  scope: rg    // Deployed in the scope of resource group we created above

  params: {
    storageAccountName: 'bicepstorageaccount1'
    storageAccountLocation: 'North Europe'
    storageAccountSku: 'Standard_LRS'
    storageAccountKind: 'StorageV2'
  }
}
 
 