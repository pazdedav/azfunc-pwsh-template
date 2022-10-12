param environmentName string
param location string = resourceGroup().location

param allowedOrigins array = []
param applicationInsightsName string = ''
param appServicePlanId string
param keyVaultName string
param serviceName string = 'func'

module functionApp '../core/host/functions-powershell.bicep' = {
  name: '${serviceName}-functions-powershell-module'
  params: {
    environmentName: environmentName
    location: location
    allowedOrigins: allowedOrigins
    applicationInsightsName: applicationInsightsName
    appServicePlanId: appServicePlanId
    keyVaultName: keyVaultName
    serviceName: serviceName
  }
}

output API_IDENTITY_PRINCIPAL_ID string = functionApp.outputs.identityPrincipalId
output API_NAME string = functionApp.outputs.name
output API_URI string = functionApp.outputs.uri
