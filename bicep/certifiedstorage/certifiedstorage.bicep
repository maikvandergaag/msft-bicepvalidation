param name string
param location string = resourceGroup().location
param storageSKU string = 'Standard_LRS'

@allowed([
  'dev'
  'tst'
  'acc'
  'prd'
])
param environment string


resource storage 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: name
  location: location
  sku: {
    name: storageSKU
  }
  kind: 'StorageV2'
  properties: {
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
  }
  tags:{
    environment: environment
  }
}
