@description('Name of the storage account (3-24 lowercase alphanumerics). Must be globally unique.')
param storageAccountName string

@allowed([
  'dev'
  'test'
  'prod'
])
@description('Environment tag value.')
param environment string = 'dev'

@description('Location for resources.')
param location string = resourceGroup().location

var commonTags = {
  environment: environment
  project:     'policy-as-code-lab'
  owner:       'automation'
}

resource sa 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  tags: commonTags
  properties: {
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
    allowBlobPublicAccess: false
    accessTier: 'Hot'
    encryption: {
      services: {
        blob: { enabled: true }
        file: { enabled: true }
      }
      keySource: 'Microsoft.Storage'
    }
  }
}

@description('Primary blob endpoint of the storage account.')
output blobEndpoint string = sa.properties.primaryEndpoints.blob

@description('Tags applied to the storage account.')
output tags object = sa.tags
