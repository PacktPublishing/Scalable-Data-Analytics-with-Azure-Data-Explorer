
param clusterName string
param location string = resourceGroup().location

@allowed([
  'Dev(No SLA)_Standard_D11_v2'
  'Dev(No SLA)_Standard_E2a_v4'
  'Standard_D11_v2'
  'Standard_D12_v2'
  'Standard_D13_v2'
])
param clusterSKU string

@allowed([
  'Basic'
  'Standard'
])
param clusterTier string
param clusterCapacity int = 1

@allowed([
  'V2'
  'V3'
])
param engineType string = 'V3'
param enableDiskEncryption bool = true
param enableDoubleDiskEncryption bool = true
param enablePurge bool = true

param dbName string
param dbHotCachePeriod string = 'P30D'
param dbSoftDeletePeriod string = 'P365D'

@allowed([
  'ReadWrite'
])
param dbKind string = 'ReadWrite'

resource adxCluster 'Microsoft.Kusto/clusters@2020-09-18' = {
  name: clusterName
  location: location
  sku: {
    name: clusterSKU
    tier: clusterTier
    capacity: clusterCapacity
  }
  properties: {
    enableDiskEncryption: enableDiskEncryption
    enableDoubleEncryption: enableDoubleDiskEncryption
    enablePurge: enablePurge
    engineType: engineType
  }
}

resource adxDatabase 'Microsoft.Kusto/clusters/databases@2020-09-18' = {
  name: dbName
  location: location
  kind: dbKind
  parent: adxCluster
  properties: {
    hotCachePeriod: dbHotCachePeriod
    softDeletePeriod: dbSoftDeletePeriod
  }
}
