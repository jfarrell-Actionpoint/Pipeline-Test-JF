@description('Specifies parameters for resources.')
param storageAccountName string
param storageAccountLocation string
param storageAccountSku string
param storageAccountKind string

resource sa1 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccountName
  location: storageAccountLocation
  sku: {
    name: storageAccountSku
  }
  kind: storageAccountKind
}
